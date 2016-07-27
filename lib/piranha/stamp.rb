require 'pdf-forms'

module Piranha
  module Stamp

    def self.perform(file, stamp)
      input = file.path
      input_stamp = stamp.path
      output = Piranha::Tempfile.generate_name

      self.stamp(input, input_stamp, output)
      return File.open(output, "r")
    end

    #
    # Add a stamp on one or all pages of a pdf
    #
    # @param [<type>] input Path to the pdf file to stamp
    # @param [<type>] input_stamp Path to the stamp file to apply
    # @param [<type>] output generated output file path
    # @param [<type>] page Page to stamp < 1 means all pages
    #
    def self.stamp(input, input_stamp, output, page = 0)
      executable = Piranha.configuration.executables[:pdftk]
      pdftk = ::PdfForms.new(executable)

      if page < 1 || Piranha::Infos.infos(input, 'count') == 1
        result = pdftk.cat(input, "stamp", input_stamp, output)
      else
        result = ""
        page_to_stamp_path = input.gsub(".pdf", "_page_to_stamp.pdf")
        stamped_file_path = input.gsub(".pdf", "stamped.pdf")

        result += pdftk.cat(input, "cat", page.to_s, page_to_stamp_path)
        result += pdftk.cat(page_to_stamp_path, "stamp", input_stamp, stamped_file_path)

        stamped_handler = "A=#{stamped_file_path}"
        input_handler = "B=#{input}"
        if page == 1
          result += pdftk.cat(stamped_handler,
                             input_handler,
                             "cat",
                             "A",
                             "B2-end",
                             output)
        else
          result += pdftk.cat(stamped_handler,
                             input_handler,
                             "cat",
                             "B1-#{page - 1}",
                             "A",
                             "B#{page + 1}-end",
                             output)
        end
        File.delete(page_to_stamp_path, stamped_file_path)
      end
      raise Exception.new(result) if result.include?("Error")
    end
  end
end
