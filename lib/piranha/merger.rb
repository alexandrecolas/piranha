module Piranha
  module Merger

    require 'pdf-forms'

    def self.perform(inputs, output)
      executable = Piranha.configuration.executables[:pdftk]

      pdftk = ::PdfForms.new(executable)
      pdftk.cat(inputs, output)
    end

  end
end
