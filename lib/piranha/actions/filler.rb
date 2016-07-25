require 'pdf-forms'
require 'piranha/actions/renderer'

module Piranha
  module Actions
    module Filler
      extend Piranha::Actions::Renderer

      def self.perform(template, datas)
        output = generate_output_path
        fill(template.path, output, datas)
        render output
      end

      def self.fill(input, output, datas)
        executable = Piranha.configuration.executables[:pdftk]
        pdftk = ::PdfForms.new(executable, utf8_fields: true, data_format: 'XFdf')
        pdftk.fill_form(input, output, datas, flatten: true)
      end
    end
  end
end
