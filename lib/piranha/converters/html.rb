module Piranha
  module Converters
    module Html

      require 'wicked_pdf'

      def self.perform(input, output)
        pdf = ::WickedPdf.new.pdf_from_html_file(input)
        File.open(output, 'wb') { |file| file << pdf }
      end

    end
  end
end
