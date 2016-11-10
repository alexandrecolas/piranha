require 'pdf-forms'
require 'piranha/actions/renderer'

module Piranha
  module Actions
    module Splitter
      extend Piranha::Actions::Renderer

      def self.perform(file, pages)
        input = file.path

        if pages.kind_of?(Array)
          render pages.map do |page|
            output = Piranha::Tempfile.generate_name
            execute(input, output, page)
          end
        else
          output = Piranha::Tempfile.generate_name
          execute(input, output, pages)
          render output
        end
      end

      def self.execute(input, ouput, page)
        executable = Piranha.configuration.executables[:pdftk]
        pdftk = ::PdfForms.new(executable)
        result = pdftk.cat(input, 'cat', page.to_s, output)

        raise Exception.new(result) if result.include?('Error')
      end
    end
  end
end
