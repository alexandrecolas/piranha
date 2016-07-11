require 'pdf-forms'

module Piranha
  module Splitter

    def self.perform(file, pages)
      input = file.path

      if pages.kind_of?(Array)
        pages.map do |page|
          output = Piranha::Tempfile.generate_name
          self.split(input, output, page)
        end
      else
        output = Piranha::Tempfile.generate_name
        self.split(input, output, pages)
      end
    end

    def self.split(input, output, page)
      self.execute(input, output, page)
      return File.open(output, "r")
    end

    def self.execute(input, output, page)
      executable = Piranha.configuration.executables[:pdftk]
      pdftk = ::PdfForms.new(executable)
      result = pdftk.cat(input, "cat", page.to_s, output)

      raise Exception.new(result) if result.include?("Error")
    end

  end
end
