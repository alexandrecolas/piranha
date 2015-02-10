module Piranha
  module Filler

    require 'pdf-forms'

    def self.perform(template, output, datas)
      executable = Piranha.configuration.executables[:pdftk]

      pdftk = ::PdfForms.new(executable, utf8_fields: true)
      pdftk.fill_form(template, output, datas)
    end

  end
end
