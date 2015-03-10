require 'spec_helper.rb'

describe Piranha::Converters::Office do
  subject { Piranha::Converters::Office }

  it_behaves_like "a Converter module"
end
