require "rubygems"
require "prawn"

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__))) unless $LOAD_PATH.include?(File.expand_path(File.dirname(__FILE__)))

require "features2cards/cli"

module Features2Cards
  VERSION = '0.1.0'
end
