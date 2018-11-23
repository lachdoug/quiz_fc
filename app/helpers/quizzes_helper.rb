module QuizzesHelper

  def quiz_status_badge( quiz )

    icon =
      if quiz.draft?
        "pen"
      elsif quiz.archived?
        "file-archive"
      else
        stage = quiz.stage
        if stage == :waiting
          "stopwatch"
        elsif stage == :current
          "play-circle"
        elsif stage == :pending
          "pause-circle"
        elsif stage == :results
          "check-circle"
        else
          "stop-circle"
        end
        end

    content_tag( :span, class: "quiz-status #{ quiz.status } #{ quiz.stage }" ) do
      concat content_tag( :i, nil, class: "fa fa-#{icon} quiz-status-icon #{ quiz.status } #{ quiz.stage }" )
      concat " #{ quiz.status.to_s.humanize }"
      concat "/#{ quiz.stage.to_s.humanize }" if quiz.live?
    end

  end

end
