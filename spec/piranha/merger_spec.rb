require 'spec_helper.rb'

describe Piranha::Merger do
  subject { Piranha::Merger }

  context "#perform" do
    let(:files) { (1..3).map { |i| Tempfile.new("input-#{i}") } }

    context "if no errors" do
      before do
        allow(Piranha::Tempfile).to receive(:generate_name) do
          "#{Piranha.configuration.temp_directory}/this_is_output"
        end

        allow(subject).to receive(:convert) do
          output = "#{Piranha.configuration.temp_directory}/this_is_output"
          File.open(output, "w") { |f| f.write("this a file") }
        end

        @result = subject.perform(files)
      end

      it "have file" do
        expect(@result.file.class).to eq File
      end

      it "have success to true" do
        expect(@result.success?).to eq true
      end
    end

    context "if errors" do
      before do
        allow(subject).to receive(:convert) { raise "this is an error" }
        @result = subject.perform(files)
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
