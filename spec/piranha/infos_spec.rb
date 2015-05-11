require 'spec_helper.rb'

describe Piranha::Infos do
  describe '#count' do
    it 'count number of pages' do
      input = File.join(File.dirname(__dir__), 'support', 'files', 'pdf.pdf')
      expect(Piranha::Infos.infos(input, 'count')).to eq(11)
    end
  end
end
