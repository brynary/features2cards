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
      if files.empty?
        usage
        exit
      end
      
      generate_pdf(cards)
    end
    
    def cards
      features_to_cards(features)
    end
    
    def features
      files.map do |file|
        parser.parse_feature(file)
      end
    end
    
    def files
      ARGV
    end
    
    def parser
      @parser ||= Cucumber::TreetopParser::FeatureParser.new
    end

    def features_to_cards(features)
      features.map do |feature|
        [Card.for_feature(feature)] +
        feature.scenarios.map do |scenario|
          Card.for_scenario(scenario)
        end
      end.flatten
    end

    def generate_pdf(cards)
      Prawn::Document.generate_cards(cards)
    end
    
    def usage
      $stderr.puts "ERROR: No feature files given"
      $stderr.puts "usage: features2cards <feature files>"
    end
    
  end
end