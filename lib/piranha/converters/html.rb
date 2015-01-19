module Piranha
  module Converters
    module Html

      def self.perform(input, output)
        executable = Piranha.configuration.executables[:wkhtmltopdf]
        WickedPdf.config = { exe_path: executable }

        pdf = WickedPdf.new.pdf_from_html_file(input)
        File.open(output, 'wb') { |file| file << pdf }
      end

    end
  end
end
