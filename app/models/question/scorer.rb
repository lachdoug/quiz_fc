class Question
  class Scorer

    require "damerau-levenshtein"

    def initialize( question, answer_attempt )
      @question = question
      @answer_attempt = answer_attempt
    end

    def process
      return apply_scoring_strategy @question.scoring, @answer_attempt.join(', ') if @question.scoring.is_a? Hash
      @question.scoring.map.with_index { |scoring_part, i| apply_scoring_strategy scoring_part, @answer_attempt[i] }.sum
    end

    private

    def configs
      ( @question.config || {} )['scoring']
    end

    def apply_scoring_strategy( scoring_stragegy, answer_attempt )
      if scoring_stragegy[:strategy] == :reg
        apply_regex_strategy( scoring_stragegy, answer_attempt )
      elsif scoring_stragegy[:strategy] == :lev
        apply_levenshtein_strategy( scoring_stragegy, answer_attempt )
      else
        raise "No scoring strategy"
      end
    end

    def apply_regex_strategy( scoring_stragegy, answer_attempt )
        key = scoring_stragegy[:map].keys.find { |key| key.match answer_attempt.strip }
        key ? scoring_stragegy[:map][key].to_i : 0
    end

    def apply_levenshtein_strategy( scoring_stragegy, answer_attempt )
      map = scoring_stragegy[:map]
      max = map.keys.max
      distance = DamerauLevenshtein.distance( @question.answer, answer_attempt, 1, max )
      map[ distance ] || 0
    end

  end
end
