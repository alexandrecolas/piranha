module Piranha

  class Configuration
    attr_accessor :executables

    def initialize
      @executables = {
        wkhtmltopdf: "/usr/local/bin/wkhtmltopdf",
        pdftk: "pdftk",
        libreoffice: nil
      }
    end

  end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configuration=(config)
      @configuration = config
    end

    def configure
      yield configuration
    end
  end

end
