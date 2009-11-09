require "features2cards/platform"
require "features2cards/cli"

module Features2Cards#:nodoc:
  class VERSION #:nodoc:
    MAJOR = 0
    MINOR = 2
    TINY  = 0
    PATCH = nil # Set to nil for official release

    STRING = [MAJOR, MINOR, TINY, PATCH].compact.join('.')
    STABLE_STRING = [MAJOR, MINOR, TINY].join('.')
  end
end

