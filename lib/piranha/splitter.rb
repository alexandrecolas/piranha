module Piranha
  module Splitter

    require 'pdf-forms'

    def self.perform(template, output, page)
      executable = Piranha.configuration.executables[:pdftk]

      pdftk = ::PdfForms.new(executable)
      result = pdftk.cat(template, "cat", page.to_s, output)

      raise result if result.include?("Error")
    end

  end
end
