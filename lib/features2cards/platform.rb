# Detect the platform we're running on so we can tweak behaviour
# in various places.
require 'rbconfig'

module Features2Cards
  BINARY        = File.expand_path(File.dirname(__FILE__) + '/../../bin/features2cards')
  JRUBY         = defined?(JRUBY_VERSION)
  IRONRUBY      = Config::CONFIG['sitedir'] =~ /IronRuby/
  WINDOWS       = Config::CONFIG['host_os'] =~ /mswin|mingw/
  WINDOWS_MRI   = WINDOWS && !JRUBY && !IRONRUBY
  RAILS         = defined?(Rails)
  RUBY_BINARY   = File.join(Config::CONFIG['bindir'], Config::CONFIG['ruby_install_name'])
  RUBY_1_9      = RUBY_VERSION =~ /^1\.9/
end
