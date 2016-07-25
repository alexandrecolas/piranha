require 'piranha/fileless_io'

# Piranha
module Piranha
  # Actions
  module Actions
    # Renderer
    module Renderer
      # Generate path for Output file
      def generate_output_path
        Piranha::Tempfile.generate_name
      end

      # Render
      def render(output)
        contents = File.open(output, 'r') { |x| x.read }
        Piranha::FilelessIO.new("#{SecureRandom.uuid}.pdf", contents)
      ensure
        FileUtils.rm(output) if output
      end
    end
  end
end
