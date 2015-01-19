module Piranha
  module Converters
    module Office

      require 'libreconv'

      def self.perform(input, output)
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
