module Piranha
  module Splitter

    require 'pdf-forms'

    def self.perform(template, output, page)
      executable = Piranha.configuration.executables[:pdftk]

      pdftk = ::PdfForms.new(executable)
      output = pdftk.cat(template, "cat", page.to_s, output)

      raise output if "Error".include?(output)
    end

  end
end
