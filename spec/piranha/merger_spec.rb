require 'spec_helper.rb'

describe Piranha::Actions::Merger do
  subject { Piranha::Actions::Merger }

  context '#perform' do
    let(:files) { (1..3).map { |i| Tempfile.new("input-#{i}") } }

    context 'if no errors' do
      before do
        allow(Piranha::Tempfile).to receive(:generate_name) do
          "#{Piranha.configuration.temp_directory}/this_is_output"
        end

        allow(subject).to receive(:convert) do
          output = "#{Piranha.configuration.temp_directory}/this_is_output"
          File.open(output, 'w') { |f| f.write('this a file') }
        end
      end

      it 'have file' do
        expect(subject.perform(files)).to eq 'this a file'
      end
    end

    context 'if errors' do
      before do
        allow(subject).to receive(:convert) { fail 'this is an error' }
      end

      it 'have error message' do
        expect { subject.perform(files) }.to raise_error 'this is an error'
      end
    end
  end
end
