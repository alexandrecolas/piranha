module Piranha
  module Converters
    module Image
      require 'wicked_pdf'

      def self.perform(input, output)
        begin
          file = Piranha::Converters::Image.convert(input, output)
          return Piranha::Response.new(status: "success", file: file)
        rescue Exception => e
          return Piranha::Response.new(status: "error", error: e.message)
        end
      end


      private
      def self.convert(input, output)
        pdf = ::WickedPdf.new.pdf_from_string("
          <center><img src='#{input}' /></center>
        ")

        File.open(output, 'wb') { |file| file << pdf }
      end

    end
  end
end
