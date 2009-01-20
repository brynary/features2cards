Feature: Generate PDF scenario cards

  So that I can keep our task board up to date easily
  As a developer
  I want to generate index cards from our Cucumber feature files

  Scenario: Generate card for the feature
  
    Given a feature file with no scenarios
    When I generate cards
    Then I should get a PDF with one feature card  
    
  Scenario: Generate scenario cards
    
    Given a feature file with one scenario
    When I generate cards
    Then I should get a PDF with one scenario card
    

