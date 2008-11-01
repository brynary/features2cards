require "rubygems"
require "prawn"

class Card
  
  attr_reader :type
  attr_reader :body
  attr_reader :footer
  
  def initialize(type, body, footer = nil)
    @type = type
    @body = body
    @footer = footer
  end
  
end

class Prawn::Document
  CARD_WIDTH  = 72 * 5 # 5 inches
  CARD_HEIGHT = 72 * 3 # 3 inches
  
  def margin_box(margin, &block)
    bounding_box [bounds.left + margin, bounds.top - margin],
      :width => bounds.width - (margin * 2), :height => bounds.height - (margin * 2),
      &block
  end
  
  def outline_box
    stroke_rectangle bounds.top_left, bounds.width, bounds.height
  end

  def draw_card(card, row, col)
    bounding_box [CARD_WIDTH * col, CARD_HEIGHT * row + ((bounds.height - (2*CARD_HEIGHT))/2)],
      :width => CARD_WIDTH, :height => CARD_HEIGHT do
        
      outline_box
    
      margin_box 18 do
        # outline_box
        text card.type + ": ", :size => 14
        
        margin_box 36 do
          # outline_box
          text card.body, :size => 16, :align => :center
        end
        
        bounding_box [bounds.left, bounds.bottom + 18], :width => bounds.width, :height => 18 do
          # outline_box
          text card.footer, :align => :right
        end
      end
    end
  end
  
end

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