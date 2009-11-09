module Features2Cards
  class Card

    attr_reader :type
    attr_reader :body
    attr_reader :footer

    def self.for_feature(feature)
      actual_feature = feature.to_sexp()
      actual_feature.shift
      actual_feature.shift
      title = actual_feature[0].split("\n").first
      footer = title
      body  = actual_feature[0].gsub(/^\s*#{title}\n/, '')
      card = [new(title, body, "")]
      footer = title

      actual_feature.shift
      scenarios = actual_feature

      scenarios.map do |scenario|
        case(scenario[0])
          when :scenario_outline
            scenario.shift
          when :scenario
            scenario.shift
            scenario.shift
          when :tag
            next
          when :comment
            next
        end
         title = scenario[0] + " " + scenario[1]
         scenario.shift
         scenario.shift
         body = ""
         scenario.map do |step|
           body += step[2] + " " + step[3] + "\n" if step[0] == :step or step[0] == :step_invocation
         end
         card.push(new(title, body, footer))
      end

      return card
    end

    def initialize(type, body, footer = nil)
      @type = type
      @body = body
      @footer = footer
    end

  end
end
