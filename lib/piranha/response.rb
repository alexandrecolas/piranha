module Piranha
  class Response

    attr_accessor :status, :file, :error

    def initialize(status: nil, file: nil, error: nil)
      @status = status
      @file = file
      @error = error
    end


    def success?
      status == "success"
    end

  end
end
