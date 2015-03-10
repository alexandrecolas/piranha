require 'pdf-forms'

module Piranha
  module Merger

    def self.perform(files)
      output = Piranha::Tempfile.generate_name
      inputs = files.map(&:path)

      begin
        self.convert(inputs, output)
        file = File.open(output, "r")
        return Piranha::Response.new(status: "success", file: file)
      rescue Exception => e
        return Piranha::Response.new(status: "error", error: e.message)
      end
    end


    def self.convert(inputs, output)
      pdftk = ::PdfForms.new Piranha.configuration.executables[:pdftk]
      pdftk.cat(inputs, output)
    end

  end
end
