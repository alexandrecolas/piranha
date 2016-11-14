require 'spec_helper.rb'

describe Piranha::Actions::Splitter do
  subject { Piranha::Actions::Splitter }

  let(:file) { File.open('/Users/alexandre/Developments/sites/recoveris/piranha/spec/support/files/pdf.pdf') }

  context "when several pages" do
    before do
      # allow(subject).to receive(:execute) { {status: 'success', file: 'file'} }
    end

    it "can take multiple pages" do
      result = subject.perform(file, [1, 2])
      binding.pry
      expect(result.size).to eq 2
    end

  end

end
