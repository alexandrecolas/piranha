module Piranha

  require 'piranha/mime_types'
  require 'piranha/converters/office'
  require 'piranha/converters/html'
  require 'piranha/converters/image'
  require 'piranha/errors/no_converter_error'

  module Converter
    def self.perform(file)
      output = Piranha::Tempfile.generate_name
      input = file.path

      mime = Piranha::MimeTypes.get(input)
      case mime
      when *Piranha::MimeTypes::IMAGES_MIME_TYPE
        Piranha::Converters::Image.perform(input, output)
      when *Piranha::MimeTypes::OFFICE_MIME_TYPES
        Piranha::Converters::Office.perform(input, output)
      when 'text/html'
        Piranha::Converters::Html.perform(input, output)
      else
        fail NoConverterError, "no converter for #{mime} type"
      end
    end
  end
end
