require 'spec_helper.rb'

describe Piranha::Converters::Html do
  subject { Piranha::Converters::Html }

  it_behaves_like "a Converter module"
end
