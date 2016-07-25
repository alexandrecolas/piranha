require 'pdf-forms'
require 'piranha/actions/renderer'

module Piranha
  module Actions
    module Stamp
      extend Piranha::Actions::Renderer

      def self.perform(file, stamp)
        output = generate_output_path
        stamp(file.path, stamp.path, output)
        render output
      end

      def self.stamp(input, input_stamp, output)
        executable = Piranha.configuration.executables[:pdftk]
        pdftk = ::PdfForms.new(executable)
        result = pdftk.cat(input, 'stamp', input_stamp, output)
        raise Exception.new(result) if result.include?('Error')
      end
    end
  end
end
