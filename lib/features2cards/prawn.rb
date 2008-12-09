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
        text card.type + ": ", :size => 14
        
        margin_box 36 do
          text card.body, :size => 16, :align => :center
        end
        
        bounding_box [bounds.left, bounds.bottom + 18], :width => bounds.width, :height => 18 do
          text card.footer, :align => :right
        end
      end
    end
  end
  
end