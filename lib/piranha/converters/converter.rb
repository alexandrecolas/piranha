# Abstract Module for converters
module Piranha
  module Converters
    module Converter
      def perform(input, output, options)
        convert(input, output, options)
        File.open(output, 'r')
      end
    end
  end
end
