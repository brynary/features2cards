require 'tempfile'
require 'features2cards'
require 'features2cards/cli'
require 'features2cards/card'
require 'features2cards/platform'

Given /^I am in (.*)$/ do |example_dir_relative_path|
  @current_dir = examples_dir(example_dir_relative_path)
end

When /^I run features2cards (.*)$/ do |features2cards_opts|
  run "#{Features2Cards::RUBY_BINARY} -I #{features2cards_lib_dir} -rrubygems #{Features2Cards::BINARY} #{features2cards_opts}"
end

Then /^it should (fail|pass)$/ do |success|
  if success == 'fail'
    last_exit_status.should_not == 0
  else
    if last_exit_status != 0
      raise "Failed with exit status #{last_exit_status}\nSTDOUT:\n#{last_stdout}\nSTDERR:\n#{last_stderr}"
    end
  end
end

Then /^it should (fail|pass) with$/ do |success, output|
  last_stdout.should == output
  Then("it should #{success}")
end

Then /it should (fail|pass) with (.*)/ do |success, output|
  last_stdout.should == Features2Cards::VERSION::STRING + "\n"
  Then("it should #{success}")
end

Then /^"(.*)" should exist$/ do |file|
  in_current_dir do
    File.exists?(file).should be_true
    FileUtils.rm(file)
  end
end

