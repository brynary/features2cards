require "features2cards/card"
require "features2cards/prawn"

module Features2Cards
  class CLI
    
    def self.execute
      load_cucumber
      new.execute
    end

    def self.load_cucumber
      $LOAD_PATH.unshift(File.expand_path("./vendor/plugins/cucumber/lib"))
  
      require "cucumber"
      require "cucumber/treetop_parser/feature_en"
      Cucumber.load_language("en")
  
      Cucumber::Tree::Feature.class_eval do
        attr_reader :scenarios
      end
    end

    def execute
      files = ARGV
      parser = Cucumber::TreetopParser::FeatureParser.new
  
      features = []
  
      files.each do |file|
        features << parser.parse_feature(file)
      end
  
      cards = features_to_cards(features)
      generate_pdf(cards)
    end

    def features_to_cards(features)
      cards = []
  
      features.map { |f| f.scenarios }.flatten.each do |scenario|
        cards << Card.new("Scenario", scenario.name, scenario.feature.header.split("\n").first)
      end
  
      cards
    end

    def generate_pdf(cards)
      Prawn::Document.generate("cards.pdf", :page_layout => :landscape) do
        row = 2
        col = 0
    
        cards.each do |card|
          if row == 0
            start_new_page
            row = 2
            col = 0
          end
      
          draw_card(card, row, col)
      
          col += 1
      
          if col > 1
            col = 0
            row -= 1
          end
        end
      end
  
    end
    
  end
end