$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'features2cards'
begin; require 'rubygems'; rescue LoadError; end
gem 'rspec'
require 'spec'
require 'spec/autorun'

