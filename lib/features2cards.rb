require "rubygems"
require "prawn"

class Prawn::Document
  
  def margin_box(margin, &block)
    bounding_box [bounds.left + margin, bounds.top - margin],
      :width => bounds.width - (margin * 2), :height => bounds.height - (margin * 2),
      &block
  end
  
  def outline_box
    stroke_rectangle bounds.top_left, bounds.width, bounds.height
  end
  
end

class Features2Cards
  VERSION = '0.1.0'
  
  CARD_WIDTH  = 72 * 5 # 5 inches
  CARD_HEIGHT = 72 * 3 # 3 inches
  
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
      row = 2
      col = 0
      
      features.scenarios.each do |scenario|
        if row == 0
          start_new_page
          row = 2
          col = 0
        end
        
        bounding_box [CARD_WIDTH * col, CARD_HEIGHT * row], :width => CARD_WIDTH, :height => CARD_HEIGHT do
          outline_box
        
          margin_box 18 do
            text "Scenario: ", :size => 14
            
            margin_box 36 do
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
    
    def draw_scenario_card(scenario, row, col)
    end
    
  end
  
end