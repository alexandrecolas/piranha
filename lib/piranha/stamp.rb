module Piranha
  module Stamp

    require 'pdf-forms'

    def self.perform(template, output, stamp)
      executable = Piranha.configuration.executables[:pdftk]

      pdftk = ::PdfForms.new(executable)
      result = pdftk.cat(template, "stamp", stamp, output)

      raise Exception.new(result) if result.include?("Error")
    end

  end
end
