module Piranha
  module Converters
    module Image

      def self.perform(input, output)
        executable = Piranha.configuration.executables[:wkhtmltopdf]
        WickedPdf.config = { exe_path: executable }

        pdf = WickedPdf.new.pdf_from_string("
          <center><img src='#{input}' /></center>
        ")
        File.open(output, 'wb') { |file| file << pdf }
      end

    end
  end
end
