require 'mime/types'

module Piranha

  module MimeTypes

    OFFICE_MIME_TYPES = [
      "application/msword",
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
      "application/vnd.ms-excel",
      "application/excel",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
      "application/vnd.ms-powerpoint",
      "application/vnd.openxmlformats-officedocument.presentationml.presentation",
      "application/vnd.oasis.opendocument.text",
      "application/vnd.oasis.opendocument.presentation",
      "application/vnd.oasis.opendocument.spreadsheet"
    ]

    IMAGES_MIME_TYPE = [
      "image/jpeg",
      "image/gif",
      "image/png"
    ]


    def self.get(path)
      return ::MIME::Types.type_for(path).first.try(&:content_type)
    end

  end

end
