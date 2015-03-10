require 'wicked_pdf'
require 'piranha/converters/converter'

module Piranha
  module Converters
    module Image
      extend Piranha::Converters::Converter

      def self.convert(input, output)
        html = "<center><img src='#{input}' /></center>"
        pdf = ::WickedPdf.new.pdf_from_string(html)
        File.open(output, 'wb') { |file| file << pdf }
      end

    end
  end
end
