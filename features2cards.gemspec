# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{features2cards}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bryan Helmkamp"]
  s.date = %q{2009-11-09}
  s.default_executable = %q{features2cards}
  s.description = %q{Create PDF cards from Cucumber features and scenarios for printing. We use it as we kick
off our sprints to create index cards for our task board.}
  s.email = %q{bryan@brynary.com}
  s.executables = ["features2cards"]
  s.extra_rdoc_files = [
    "History.txt",
    "README.rdoc",
    "MIT-LICENSE.txt"
  ]
  s.files = [
    ".gitignore",
    "History.txt",
    "MIT-LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "Thorfile",
    "bin/features2cards",
    "examples/i18n/.gitignore",
    "examples/i18n/README.textile",
    "examples/i18n/Rakefile",
    "examples/i18n/ar/addition.feature",
    "examples/i18n/bg/addition.feature",
    "examples/i18n/bg/consecutive_calculations.feature",
    "examples/i18n/bg/division.feature",
    "examples/i18n/cat/suma.feature",
    "examples/i18n/da/summering.feature",
    "examples/i18n/de/addition.feature",
    "examples/i18n/de/division.feature",
    "examples/i18n/en-lol/stuffing.feature",
    "examples/i18n/en/addition.feature",
    "examples/i18n/en/division.feature",
    "examples/i18n/es/adicion.feature",
    "examples/i18n/et/jagamine.feature",
    "examples/i18n/et/liitmine.feature",
    "examples/i18n/fi/jakolasku.feature",
    "examples/i18n/fi/yhteenlasku.feature",
    "examples/i18n/fr/addition.feature",
    "examples/i18n/he/addition.feature",
    "examples/i18n/he/division.feature",
    "examples/i18n/hu/addition.feature",
    "examples/i18n/hu/division.feature",
    "examples/i18n/id/addition.feature",
    "examples/i18n/id/division.feature",
    "examples/i18n/it/somma.feature",
    "examples/i18n/ja/addition.feature",
    "examples/i18n/ja/division.feature",
    "examples/i18n/ko/addition.feature",
    "examples/i18n/ko/division.feature",
    "examples/i18n/lt/addition.feature",
    "examples/i18n/lt/division.feature",
    "examples/i18n/lv/addition.feature",
    "examples/i18n/lv/division.feature",
    "examples/i18n/no/summering.feature",
    "examples/i18n/pl/addition.feature",
    "examples/i18n/pl/division.feature",
    "examples/i18n/pt/adicao.feature",
    "examples/i18n/ro/suma.feature",
    "examples/i18n/ru/addition.feature",
    "examples/i18n/ru/consecutive_calculations.feature",
    "examples/i18n/ru/division.feature",
    "examples/i18n/se/summering.feature",
    "examples/i18n/sk/addition.feature",
    "examples/i18n/sk/division.feature",
    "examples/i18n/zh-CN/addition.feature",
    "examples/i18n/zh-TW/addition.feature",
    "examples/i18n/zh-TW/division.feature",
    "examples/self_test/.gitignore",
    "examples/self_test/features/features2cards.feature",
    "features/features2cards_cli.feature",
    "features/step_definitions/features2cards_steps.rb",
    "features/support/env.rb",
    "features2cards.gemspec",
    "lib/features2cards.rb",
    "lib/features2cards/card.rb",
    "lib/features2cards/cli.rb",
    "lib/features2cards/platform.rb",
    "lib/features2cards/prawn.rb",
    "spec/features2cards/card_spec.rb",
    "spec/features2cards/cli_spec.rb",
    "spec/features2cards/prawn_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/brynary/features2cards}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{features2cards}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Generate printable PDF index cards from Cucumber feature files}
  s.test_files = [
    "spec/features2cards/card_spec.rb",
    "spec/features2cards/cli_spec.rb",
    "spec/features2cards/prawn_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<prawn>, [">= 0"])
    else
      s.add_dependency(%q<prawn>, [">= 0"])
    end
  else
    s.add_dependency(%q<prawn>, [">= 0"])
  end
end
