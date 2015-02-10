module Piranha
  module Splitter

    require 'pdf-forms'

    def self.perform(template, output, page)
      executable = Piranha.configuration.executables[:pdftk]

      pdftk = ::PdfForms.new(executable)
      pdftk.cat(template, "cat", page.to_s, output)
    end

  end
end
