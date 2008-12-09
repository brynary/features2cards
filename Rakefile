require 'rubygems'
require "rake/gempackagetask"
require "rake/clean"
require './lib/features2cards.rb'

spec = Gem::Specification.new do |s|
  s.name         = "features2cards"
  s.version      = Features2Cards::VERSION
  s.author       = "Bryan Helmkamp"
  s.email        = "bryan" + "@" + "brynary.com"
  s.homepage     = "http://github.com/brynary/features2cards"
  s.summary      = "features2cards. Generate printable PDF index cards from Cucumber feature files"
  s.description  = s.summary
  s.files        = %w[History.txt MIT-LICENSE.txt README.rdoc Rakefile] + Dir["bin/*"] + Dir["lib/**/*"] + Dir["vendor/**/*"]
  
  s.add_dependency "prawn"
end

Rake::GemPackageTask.new(spec) do |package|
  package.gem_spec = spec
end

desc 'Show information about the gem.'
task :write_gemspec do
  File.open("features2cards.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
  puts "Generated: features2cards.gemspec"
end

CLEAN.include ["pkg", "*.gem", "doc", "ri", "coverage"]

desc 'Install the package as a gem.'
task :install_gem => [:clean, :package] do
  gem = Dir['pkg/*.gem'].first
  sh "sudo gem install --local #{gem}"
end

