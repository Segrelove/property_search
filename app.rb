require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'scraper'

Scraper.new.perform