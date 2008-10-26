require "rubygems"
require "prawn"

class Features2Cards
  VERSION = '0.1.0'
  
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
    file = ARGV.first
    parser = Cucumber::TreetopParser::FeatureParser.new
    
    features = parser.parse_feature(file)
    generate_pdf(features)
  end
  
  def generate_pdf(features)
    Prawn::Document.generate("cards.pdf", :page_layout => :landscape) do
      height  = 72 * 3
      width   = 72 * 5
      
      card_margin = 18
      card_margin2 = 36
      row = 2
      col = 0
      
      features.scenarios.first(4).each do |scenario|        
        bounding_box [width * col, height * row], :width => width, :height => height do
          stroke_rectangle bounds.top_left, bounds.width, bounds.height
        
          bounding_box [bounds.left + card_margin, bounds.top - card_margin],
              :width => width - (card_margin * 2), :height => height - (card_margin * 2) do
            
            text "Scenario: ", :size => 14
            
            bounding_box [bounds.left + card_margin2, bounds.top - card_margin2],
                :width => bounds.width - (card_margin2 * 2), :height => bounds.height - (card_margin2 * 2) do
              text scenario.name, :size => 16, :align => :center
            end
          end
        end
            
        col += 1
        
        if col > 1
          col = 0
          row -= 1
        end
      end
    end
    
  end
  
end