require 'rubygems'
require "rake/gempackagetask"
require "rake/clean"
require "spec/rake/spectask"
require 'cucumber/rake/task'

$:.unshift('lib')
require 'features2cards'

desc "Run the Features2Cards specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "spec/spec.opts"]
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.rcov = ENV['RCOV']
  t.rcov_opts = %w{--exclude osx\/objc,gems\/,spec\/}
  t.verbose = true
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty"
end

namespace :features do
  Cucumber::Rake::Task.new(:rcov) do |t|
    t.rcov = true
    t.rcov_opts = %w{--rails --exclude osx\/objc,gems\/,spec\/}
    t.rcov_opts << %[-o "features_rcov"]
  end
end


