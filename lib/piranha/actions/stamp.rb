require 'pdf-forms'
require 'piranha/actions/renderer'

module Piranha
  module Actions
    module Stamp
      extend Piranha::Actions::Renderer

      def self.perform(file, stamp, page = -1)
        output = generate_output_path
        stamp(file.path, stamp.path, output, page)
        render output
      end

      #
      # Add a stamp on one or all pages of a pdf
      #
      # @param [String]   input Path to the pdf file to stamp
      # @param [String]   input_stamp Path to the stamp file to apply
      # @param [String]   output generated output file path
      # @param [Integer]  page Page to stamp < 1 means all pages
      #
      def self.stamp(input, input_stamp, output, page)
        executable = Piranha.configuration.executables[:pdftk]
        pdftk = ::PdfForms.new(executable)

        if page < 1 || Piranha::Actions::Infos.infos(input, "count") == 1
          result = pdftk.cat(input, "stamp", input_stamp, output)
          raise Exception.new(result) if result.include?("Error")
          return
        end

        page_to_stamp_path = input.gsub(".pdf", "_page_to_stamp.pdf")
        stamped_file_path = input.gsub(".pdf", "stamped.pdf")

        #extract page to stamp
        Piranha::Actions::Splitter.execute(input, page_to_stamp_path, page)
        #create stamped version of the page to stamp
        pdftk.cat(page_to_stamp_path, "stamp", input_stamp, stamped_file_path)

        replace_page(input, stamped_file_path, output, page)
        File.delete(page_to_stamp_path, stamped_file_path)
      end

      #
      # Replace page at index {page} in pdf at path {input} with page at path
      # {replace_file_path} and save results at path {output}
      #
      # @param [String] input             Original pdf file path
      # @param [String] replace_file_path Replacement pdf file path
      # @param [String] output            Generated version save path
      # @param [Integer] page             Index of the page to replace in file
      #                                   at {input} path
      #
      def self.replace_page(input, replace_file_path, output, page)
        executable = Piranha.configuration.executables[:pdftk]
        pdftk = ::PdfForms.new(executable)

        replacement_handler = "A=#{replace_file_path}"
        input_handler = "B=#{input}"

        recombine_base_args = [replacement_handler, input_handler, "cat"]
        page_count = Piranha::Actions::Infos.infos(input, "count")

        replace_args =  if (page == 1)
                          ["A", "B2-end", output]
                        else
                          last_segment = (page == page_count) ? nil : "B#{page + 1}-end"
                          [
                            "B1-#{page - 1}",
                            "A",
                            last_segment,
                            output
                          ].compact
                        end
        result = pdftk.cat(recombine_base_args.concat(replace_args))
        raise Exception.new(result) if result.include?("Error")
      end
    end
  end
end
