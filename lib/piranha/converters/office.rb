module Piranha
  module Converters
    module Office

      def self.perform(input, output)
        executable = Piranha.configuration.executables[:libreoffice]
        Libreconv.convert(input, output, executable)
      end

    end
  end
end
