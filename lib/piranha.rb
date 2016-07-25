require 'active_support'

require 'piranha/version'
require 'piranha/configuration'
require 'piranha/checker'
require 'piranha/actions/converter'
require 'piranha/actions/merger'
require 'piranha/actions/filler'
require 'piranha/actions/getter'
require 'piranha/actions/splitter'
require 'piranha/actions/stamp'
require 'piranha/actions/infos'
require 'piranha/tempfile'
require 'piranha/response'

module Piranha

  # Actions
  def self.convert(file, options)
    Piranha::Actions::Converter.perform(file, options)
  end

  def self.merge(files)
    Piranha::Actions::Merger.perform(files)
  end

  def self.fill(template, datas)
    Piranha::Actions::Filler.perform(template, datas)
  end

  def self.split(file, pages)
    Piranha::Actions::Splitter.perform(file, pages)
  end

  def self.get(file, pages)
    Piranha::Actions::Getter.perform(file, pages)
  end

  def self.stamp(file, stamp)
    Piranha::Actions::Stamp.perform(file, stamp)
  end

  def self.count(file)
    Piranha::Actions::Infos.perform(file, 'count')
  end

  # Root
  def self.root
    File.expand_path('../..', __FILE__)
  end
end
