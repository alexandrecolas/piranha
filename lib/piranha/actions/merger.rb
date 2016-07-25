require 'pdf-forms'
require 'piranha/actions/renderer'

# Piranha
module Piranha
  # Actions
  module Actions
    # Merger
    module Merger
      extend Piranha::Actions::Renderer

      # Perform
      def self.perform(files)
        output = generate_output_path
        merge(files.map(&:path), output)
        render output
      end

      # Convert
      def self.merge(inputs, output)
        pdftk = ::PdfForms.new Piranha.configuration.executables[:pdftk]
        pdftk.cat(inputs, output)
      end
    end
  end
end
