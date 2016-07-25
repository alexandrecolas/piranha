require 'piranha/mime_types'
require 'piranha/converters/office'
require 'piranha/converters/html'
require 'piranha/converters/image'
require 'piranha/errors/no_converter_error'
require 'piranha/actions/renderer'

module Piranha
  module Actions
    module Converter
      extend Piranha::Actions::Renderer

      def self.perform(file, options = {})
        output = generate_output_path
        convert(file.path, output, options)
        render output
      end

      def self.convert(input, output, options)
        case Piranha::MimeTypes.get(input)
        when 'text/html'
          Piranha::Converters::Html.perform(input, output, options)
        when *Piranha::MimeTypes::IMAGES_MIME_TYPE
          Piranha::Converters::Image.perform(input, output, options)
        when *Piranha::MimeTypes::OFFICE_MIME_TYPES
          Piranha::Converters::Office.perform(input, output, options)
        else
          fail NoConverterError, "no converter for #{mime} type"
        end
      end
    end
  end
end
