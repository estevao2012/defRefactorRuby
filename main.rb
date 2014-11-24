#!/usr/bin/env ruby

require 'active_support'
require 'active_support/dependencies' 

Dir["#{File.dirname(__FILE__)}/refactor/*.rb"].each {|file| require file } 

class Main
  include Refactor 
 
  def self.run folder
    versions = File.new("#{File.dirname(__FILE__)}/toys/#{folder}/versions/")  
    core_versions = Core.new versions  
    core_versions.run_parallel_versions 
  end
end

Main.run ARGV[0]

# https://github.com/wildbit/postmark-gem
# https://github.com/oscardelben/Hare
# https://github.com/mailjet/mailjet-gem
