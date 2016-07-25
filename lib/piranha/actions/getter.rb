require 'pdf-forms'
require 'piranha/actions/renderer'

module Piranha
  module Actions

    # Get Pages of pdf
    module Getter
      extend Piranha::Actions::Renderer

      def self.perform(file, pages)
        pages.is_a? ? pages.map { |p| split(file, p) } : split(file, pages)
      end

      def self.split(file, page)
        output = generate_output_path
        split(file.path, output, page)
        render output
      end

      def self.execute(input, output, page)
        executable = Piranha.configuration.executables[:pdftk]
        pdftk = ::PdfForms.new(executable)
        result = pdftk.cat(input, 'cat', page.to_s, output)

        raise Exception.new(result) if result.include?('Error')
      end
    end
  end
end
