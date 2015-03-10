require 'spec_helper.rb'

describe Piranha::Converters::Image do
  subject { Piranha::Converters::Image }

  it_behaves_like "a Converter module"
end
