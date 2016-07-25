module Piranha
  module Tempfile
    def self.generate_name
      "#{Piranha.root}/#{SecureRandom.uuid}.pdf"
    end
  end
end
