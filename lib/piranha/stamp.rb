module Piranha
  module Stamp

    require 'pdf-forms'

    def self.perform(template, output, stamp)
      executable = Piranha.configuration.executables[:pdftk]

      pdftk = ::PdfForms.new(executable)
      output = pdftk.cat(template, "stamp", stamp, output)

      raise output if output.include?("Error")
    end

  end
end
