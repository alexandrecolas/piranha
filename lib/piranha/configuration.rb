module Piranha

  class Configuration
    attr_accessor :executables, :temp_directory

    def initialize
      # Init executable
      @executables = {
        wkhtmltopdf: "/usr/local/bin/wkhtmltopdf",
        pdftk: "pdftk",
        libreoffice: nil
      }

      # Init temp directory
      @temp_directory = Dir.mktmpdir("pyranha_gem")
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

      # wkhtmltopdf
      executable = Piranha.configuration.executables[:wkhtmltopdf]
      ::WickedPdf.config = { exe_path: executable }
    end
  end

end
