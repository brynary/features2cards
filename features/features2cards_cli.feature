Feature: Feature2Cards command line
  In order to visualize features and scenarios in sprint meetings
  Developers should be able to get them in a printable form

  Scenario: Run features2cards for a single feature
    Given I am in self_test  
    When I run features2cards features/features2cards.feature
    Then it should pass 
    And "cards.pdf" should exist

  Scenario: Run features2cards for a feature with custom output file name given
    Given I am in self_test  
    When I run features2cards --out test.pdf features/features2cards.feature
    Then it should pass
    And "test.pdf" should exist
    
  Scenario: Run features2cards for cucumber german example using a directory as input
    Given I am in i18n 
    When I run features2cards --out german_cards.pdf de
    Then it should pass
    And "german_cards.pdf" should exist

  Scenario: Run features2cards with option: --version
    When I run features2cards --version
    Then it should pass with <actual version> 

  Scenario: Run features2cards with option: --help
    When I run features2cards --help
    Then it should pass with
"""
Usage: features2cards [options] [ [FILE|DIR] ]+

Examples:
features2cards features2cards.feature
features2cards examples/i18n/it
    -o, --out [FILE]                 Specify pdf output file (Default: cards.pdf).
        --version                    Show version.
    -h, --help                       You're looking at it.

"""
