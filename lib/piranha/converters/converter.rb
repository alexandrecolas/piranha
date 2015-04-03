# Abstract Module for converters
module Piranha
  module Converters
    module Converter
      def perform(input, output)
        convert(input, output)
        File.open(output, 'r')
      end
    end
  end
end
