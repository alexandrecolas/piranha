require 'pdf-forms'
require 'piranha/actions/renderer'

module Piranha
  module Actions
    module Infos
      def self.perform(file, type = 'all')
        input = file.path
        infos(input, type)
      end

      def self.infos(input, type)
        executable = Piranha.configuration.executables[:pdftk]
        pdftk = ::PdfForms.new(executable)
        result = pdftk.call_pdftk(input, 'dump_data')

        raise Exception.new(result) if result.include?('Error')

        case type
        when 'count' then count(result)
        end
      end

      def self.count(result)
        result.split("\n").detect { |x| x.include? 'NumberOfPages' }
          .split(':').last.strip.to_i
      end
    end
  end
end
