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
  end
  
  def execute
    file = ARGV.first
    parser = ::Cucumber::TreetopParser::FeatureParser.new
    features = parser.parse_feature(file)
    generate_pdf
  end
  
  def generate_pdf
    Prawn::Document.generate("cards.pdf", :page_layout => :landscape) do
      columns = 2
      rows    = 2
      height  = 72 * 3
      width   = 72 * 5
      
      rows.downto(1) do |row|
        columns.times do |col|
          bounding_box [width * col, height * row], :width => width, :height => height do
            stroke_rectangle [bounds.left, bounds.top], bounds.width, bounds.height
          end
        end
      end
    end
  end
  
end