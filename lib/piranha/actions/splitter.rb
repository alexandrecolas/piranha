require 'pdf-forms'
require 'piranha/actions/renderer'

module Piranha
  module Actions
    module Splitter
      extend Piranha::Actions::Renderer

      def self.perform(file, pages)
        input = file.path

        if pages.kind_of?(Array)
          outputs = pages.map do |page|
            output = generate_output_path
            execute(input, output, page)
            output
          end
          render outputs
        else
          output = generate_output_path
          execute(input, output, pages)
          render output
        end
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
