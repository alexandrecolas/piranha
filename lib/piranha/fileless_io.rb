module Piranha
  # FilelessIO
  class FilelessIO < StringIO
    attr_accessor :original_filename

    def initialize(name, contents)
      super(contents)
      self.original_filename = name
    end
  end
end
