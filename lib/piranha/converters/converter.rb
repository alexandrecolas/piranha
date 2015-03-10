# Abstract Module for converters
module Piranha
  module Converters
    module Converter

      def perform(input, output)
        begin
          file = self.convert(input, output)
          return Piranha::Response.new(status: "success", file: file)
        rescue Exception => e
          return Piranha::Response.new(status: "error", error: e.message)
        end
      end

    end
  end
end
