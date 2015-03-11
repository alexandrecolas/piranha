require 'pdf-forms'

module Piranha
  module Filler

    def self.perform(template, datas)
      input = template.path
      output = Piranha::Tempfile.generate_name

      self.fill(input, output, datas)
      return File.open(output, "r")
    end


    def self.fill(input, output, datas)
      executable = Piranha.configuration.executables[:pdftk]
      pdftk = ::PdfForms.new(executable, utf8_fields: true, data_format: 'XFdf')
      pdftk.fill_form(input, output, datas, flatten: true)
    end

  end
end
