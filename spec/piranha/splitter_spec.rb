require 'spec_helper.rb'

describe Piranha::Splitter do
  subject { Piranha::Splitter }

  let(:file) { Tempfile.new("input") }

  context "when several pages" do
    before do
      allow(subject).to receive(:split) { {status: "success", file: "file"} }
    end

    it "can take multiple pages" do
      result = subject.perform(file, [1, 2])
      expect(result.size).to eq 2
    end

  end

end
