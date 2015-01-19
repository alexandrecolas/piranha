require 'spec_helper.rb'

describe Piranha do
  before do
    Piranha.configure do |config|
      config.executables[:wkhtmltopdf] = "wkhtmltopdf"
      config.executables[:pdftk] = "pdftk"
      config.executables[:libreoffice] = "libreoffice"
    end
  end

  it "should be possible to configure excutables" do
    expect(Piranha.configuration.executables[:wkhtmltopdf]).to eq "wkhtmltopdf"
    expect(Piranha.configuration.executables[:pdftk]).to eq "pdftk"
    expect(Piranha.configuration.executables[:libreoffice]).to eq "libreoffice"
  end
end
