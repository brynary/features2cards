module Features2Cards
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
end