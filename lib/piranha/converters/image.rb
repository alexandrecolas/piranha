require 'wicked_pdf'
require 'piranha/converters/converter'

module Piranha
  module Converters
    module Image
      extend Piranha::Converters::Converter

      def self.convert(input, output)
        executable = Piranha.configuration.executables[:wkhtmltopdf]
        ::WickedPdf.config = { exe_path: executable }

        html = "<center><img src='#{input}' style='max-width: 21cm;' /></center>"
        pdf = ::WickedPdf.new.pdf_from_string(html)
        File.open(output, 'wb') { |file| file << pdf }
      end
    end
  end
end
