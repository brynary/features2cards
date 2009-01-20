module Features2Cards
  class Card
  
    attr_reader :type
    attr_reader :body
    attr_reader :footer

    def self.for_feature(feature)
      new("Feature", feature.header.split("\n").first.gsub(/^\s*Feature:/, '').strip, "")
    end
    
    def self.for_scenario(scenario)
      new("Scenario", scenario.name, scenario.feature.header.split("\n").first)
    end
    
    def initialize(type, body, footer = nil)
      @type = type
      @body = body
      @footer = footer
    end
  
  end
end