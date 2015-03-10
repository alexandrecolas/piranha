module Piranha
  module Tempfile

    def self.generate_name
      "#{Piranha.configuration.temp_directory}/#{SecureRandom.uuid}"
    end

  end
end
