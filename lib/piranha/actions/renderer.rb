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
        if output.is_a? Array
          output.each { |file| render_file(file) }
        else
          render_file(output)
        end
      ensure
        if output.present?
          if output.is_a? Array
            output.each { |file| FileUtils.rm(file) }
          else
            FileUtils.rm(output)
          end
        end
      end

      private

      # Render File
      # @private
      def render_file(file)
        if Piranha.configuration.format == :tempfile
          file
        else
          contents = File.open(file, 'r') { |x| x.read }
          Piranha::FilelessIO.new("#{SecureRandom.uuid}.pdf", contents)
        end
      end
    end
  end
end
