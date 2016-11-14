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
        if output.is_a? String
          render_file(output)
        else
          output.map { |file| render_file(file) }
        end
      end

      private

      # Render File
      # @private
      def render_file(path)
        file = File.open(path, 'r')
        if Piranha.configuration.format == :tempfile
          file
        else
          Piranha::FilelessIO.new("#{SecureRandom.uuid}.pdf", file.read)
        end
      end
    end
  end
end
