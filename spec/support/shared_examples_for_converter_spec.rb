require 'spec_helper.rb'

shared_examples "a Converter module" do

  context "#perform" do
    let(:input) { Tempfile.new('input') }
    let(:output) { Piranha::Tempfile.generate_name }

    context "if no errors" do
      before do
        allow(subject).to receive(:convert) do
          File.open(output, "w") { |f| f.write("this a file") }
        end
      end

      it "have file" do
        file = subject.perform(input, output)
        expect(file.class).to eq File
      end

    end

    context "if errors" do
      before do
        allow(subject).to receive(:convert) { raise "this is an error" }
      end

      it "have error message" do
        expect { subject.perform(input, output) }.to raise_error "this is an error"
      end
    end

  end

end
