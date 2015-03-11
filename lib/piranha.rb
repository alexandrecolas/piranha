require 'active_support'

require "piranha/version"
require "piranha/configuration"
require "piranha/checker"
require "piranha/converter"
require "piranha/merger"
require "piranha/filler"
require "piranha/splitter"
require "piranha/stamp"
require "piranha/tempfile"
require "piranha/response"

module Piranha

  def self.convert(file)
    Piranha::Converter.perform(file)
  end

  def self.merge(files)
    Piranha::Merger.perform(files)
  end

  def self.fill(template, datas)
    Piranha::Filler.perform(template, datas)
  end

  def self.split(file, pages)
    Piranha::Splitter.perform(file, pages)
  end

  def self.stamp(file, stamp)
    Piranha::Stamp.perform(file, stamp)
  end

end
