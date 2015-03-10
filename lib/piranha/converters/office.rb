require 'libreconv'
require 'piranha/converters/converter'

module Piranha
  module Converters
    module Office
      extend Piranha::Converters::Converter

      def self.convert(input, output)
        executable = Piranha.configuration.executables[:libreoffice]

        if executable
          ::Libreconv.convert(input, output, executable)
        else
          ::Libreconv.convert(input, output)
        end
      end

    end
  end
end
