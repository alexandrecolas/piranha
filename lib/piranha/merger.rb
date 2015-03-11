require 'pdf-forms'

module Piranha
  module Merger

    def self.perform(files)
      output = Piranha::Tempfile.generate_name
      inputs = files.map(&:path)

      self.convert(inputs, output)
      return File.open(output, "r")
    end


    def self.convert(inputs, output)
      pdftk = ::PdfForms.new Piranha.configuration.executables[:pdftk]
      pdftk.cat(inputs, output)
    end

  end
end
