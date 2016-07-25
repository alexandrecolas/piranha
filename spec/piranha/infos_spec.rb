require 'spec_helper.rb'

describe Piranha::Actions::Infos do
  describe '#count' do
    it 'count number of pages' do
      input = File.join(File.dirname(__dir__), 'support', 'files', 'pdf.pdf')
      expect(Piranha::Actions::Infos.infos(input, 'count')).to eq(11)
    end
  end
end
