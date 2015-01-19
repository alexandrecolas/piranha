require 'active_support'

require "piranha/version"
require "piranha/configuration"
require "piranha/converter"


module Piranha


  def self.convert(input, output)
    Piranha::Converter.perform(input, output)
  end





end
