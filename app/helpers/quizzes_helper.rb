module QuizzesHelper

  def quiz_status_badge( quiz )

    content_tag( :span, class: "quiz-status #{ quiz.status } #{ quiz.stage }" ) do
      concat quiz_status_icon( quiz )
      concat " #{ quiz.status.to_s.humanize }"
      concat "/#{ quiz.stage.to_s.humanize }" if quiz.live?
    end

  end

  def quiz_status_icon( quiz )

    icon =
      if quiz.draft?
        "file"
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

    content_tag( :i, nil, class: "fa fa-#{icon} quiz-status-icon #{ quiz.status } #{ quiz.stage }" )

  end

  def quiz_stage_badge( quiz )

    content_tag( :span, class: "quiz-status #{ quiz.status } #{ quiz.stage }" ) do
      concat quiz_stage_icon( quiz )
      concat " "
      concat "Maintenance" if quiz.draft?
      concat quiz.stage.to_s.humanize if quiz.live?
      concat "Archived" if quiz.archived?
    end

  end

  def quiz_stage_icon( quiz )

    icon =
      if quiz.draft?
        "wrench"
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

    content_tag( :i, nil, class: "fa fa-#{icon} quiz-status-icon #{ quiz.status } #{ quiz.stage }" )

  end

end
