module Piranha
  module Stamp

    require 'pdf-forms'

    def self.perform(template, output, stamp)
      executable = Piranha.configuration.executables[:pdftk]

      pdftk = ::PdfForms.new(executable)
      pdftk.cat(template, "stamp", stamp, output)
    end

  end
end
