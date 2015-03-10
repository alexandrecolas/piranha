require 'spec_helper.rb'

shared_examples "a Converter module" do

  context "#perform" do
    let(:input) { Tempfile.new('input') }
    let(:output) { Piranha::Tempfile.generate_name }

    context "if no errors" do
      before do
        allow(subject).to receive(:convert) { Tempfile.new('output') }
        @result = subject.perform(input, output)
      end

      it "have file" do
        expect(@result.file.class).to eq Tempfile
      end

      it "have success to true" do
        expect(@result.success?).to eq true
      end
    end

    context "if errors" do
      before do
        allow(subject).to receive(:convert) { raise "this is an error" }
        @result = subject.perform(input, output)
      end

      it "have success to false" do
        expect(@result.success?).to eq false
      end

      it "have error message" do
        expect(@result.error).to eq "this is an error"
      end
    end

  end

end
