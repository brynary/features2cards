# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{features2cards}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bryan Helmkamp"]
  s.date = %q{2008-12-08}
  s.default_executable = %q{features2cards}
  s.description = %q{features2cards. Generate printable PDF index cards from Cucumber feature files}
  s.email = %q{bryan@brynary.com}
  s.executables = ["features2cards"]
  s.files = ["History.txt", "MIT-LICENSE.txt", "README.rdoc", "Rakefile", "bin/features2cards", "lib/features2cards", "lib/features2cards/card.rb", "lib/features2cards/cli.rb", "lib/features2cards/prawn.rb", "lib/features2cards.rb"]
  s.homepage = %q{http://github.com/brynary/features2cards}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{features2cards. Generate printable PDF index cards from Cucumber feature files}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<prawn>, [">= 0"])
    else
      s.add_dependency(%q<prawn>, [">= 0"])
    end
  else
    s.add_dependency(%q<prawn>, [">= 0"])
  end
end
