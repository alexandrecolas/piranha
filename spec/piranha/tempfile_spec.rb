require 'spec_helper.rb'

describe Piranha::Tempfile do

  it "generate filename in temp directory for output" do
    allow(SecureRandom).to receive(:uuid) { "uuid" }
    allow(Piranha.configuration).to receive(:temp_directory) { "/tmp" }

    expect(Piranha::Tempfile.generate_name).to eq "/tmp/uuid"
  end

end
