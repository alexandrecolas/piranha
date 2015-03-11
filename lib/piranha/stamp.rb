require 'pdf-forms'

module Piranha
  module Stamp

    def self.perform(file, stamp)
      input = file.path
      input_stamp = stamp.path
      output = Piranha::Tempfile.generate_name

      self.stamp(input, input_stamp, output)
      return File.open(output, "r")
    end

    def self.stamp(input, input_stamp, output)
      executable = Piranha.configuration.executables[:pdftk]
      pdftk = ::PdfForms.new(executable)
      result = pdftk.cat(input, "stamp", input_stamp, output)

      raise Exception.new(result) if result.include?("Error")
    end

  end
end
