class Question
  class Scoring

    def initialize( question )
      @question = question
    end

    def process
      return custom_scoring if configs
      default_strategy
    end

    private

    def configs
      @configs ||= ( @question.config || {} )['scoring']
    end

    def custom_scoring
      return scoring_hash_for( configs ) if configs.is_a? Hash
      configs.map { |config| scoring_hash_for config  }
    end
    #
    def scoring_hash_for( config_hash )
      raise EncodingError, "scoring: must be a hash" unless config_hash.is_a? Hash
      if config_hash['reg']
        { strategy: :reg, map: regex_scoring_for( config_hash['reg'] ) }
      elsif config_hash['lev']
        { strategy: :lev, map: levenshtein_scoring_for( config_hash['lev'] ) }
      else
        raise EncodingError, "scoring: hash must have key reg: or lev:"
      end
    end
    #
    def regex_scoring_for( regexp_config )
      regexp_config.to_a.map do |answer|
        [ answer[0].to_s.to_regexp( detect: true ), answer[1].to_i ]
      end.to_h
    end

    def levenshtein_scoring_for( levenshtein_config )
      map = levenshtein_map_config_for levenshtein_config
      {}.tap do |result|
        last_match = @question.points
        (0..map.keys.max).to_a.each do |index|
          last_match =  map[index] || last_match
          result[index] = last_match
        end
      end
    end

    def levenshtein_map_config_for( levenshtein_config )
      if levenshtein_config.is_a? Integer
        { levenshtein_config => @question.points }
      elsif levenshtein_config.is_a? Hash
        levenshtein_config.to_a.map do |answer|
          [ answer[0].to_i, answer[1].to_i ]
        end.to_h
      else
        raise EncodingError, "lev: must be a hash or an integer"
      end
    end

    def default_strategy
      { strategy: :reg,
        map: { /^#{ @question.answer.to_s.strip.gsub( ' ', '\s*' ) }$/i => @question.points }
      }
    end

  end
end
