# Abstract Module for converters
module Piranha
  module Converters
    module Converter

      def perform(input, output)
        self.convert(input, output)
        return File.open(output, "r")
      end

    end
  end
end
