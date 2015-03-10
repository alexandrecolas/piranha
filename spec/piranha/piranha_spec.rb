require 'spec_helper.rb'

describe Piranha do


  context "configure executables" do
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


  context "configure temp_directory" do
    before do
      Piranha.configure { |c| c.temp_directory = "/tmp" }
    end

    it "should be possible to configure temp_directory" do
      expect(Piranha.configuration.temp_directory).to eq "/tmp"
    end
  end

end
