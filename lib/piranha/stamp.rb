module Piranha
  module Stamp

    require 'pdf-forms'

    def self.perform(template, output, stamp)
      executable = Piranha.configuration.executables[:pdftk]

      pdftk = ::PdfForms.new(executable)
      output = pdftk.cat(template, "stamp", stamp, output)

      raise output if "Error".include?(output)
    end

  end
end
