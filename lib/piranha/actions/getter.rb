require 'pdf-forms'
require 'piranha/actions/renderer'

module Piranha
  module Actions

    # Get Pages of pdf
    module Getter
      extend Piranha::Actions::Renderer

      def self.perform(file, pages)
        pages.is_a?(Array) ? pages.map { |p| get(file, p) } : get(file, pages)
      end

      def self.get(file, page)
        output = generate_output_path
        execute(file.path, output, page)
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
