module Piranha

  require "piranha/mime_types"
  require "piranha/converters/office"
  require "piranha/converters/html"
  require "piranha/converters/image"

  module Converter

    def self.perform(input, output)
      case Piranha::MimeTypes.get(input)

      when *Piranha::MimeTypes::IMAGES_MIME_TYPE
        Piranha::Converters::Image.perform(input, output)

      when *Piranha::MimeTypes::OFFICE_MIME_TYPES
        Piranha::Converters::Office.perform(input, output)

      when "text/html"
        Piranha::Converters::Html.perform(input, output)

      end
    end

  end
end
