module Piranha

  module Filler

    def self.perform(template, output, datas)
      executable = Piranha.configuration.executables[:pdftk]

      pdftk = PdfForms.new(executable)
      pdftk.fill_form(template, output, datas)
    end

  end
end
