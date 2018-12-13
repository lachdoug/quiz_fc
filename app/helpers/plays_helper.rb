module PlaysHelper

  def play_status_badge( play )

    content_tag( :span, class: "play-status #{ play.status }" ) do
      concat play_status_icon( play )
      concat " #{ play.status.to_s.humanize }"
    end

  end

  def play_status_icon( play )

    icon = if play.playing?
      "play-circle"
    elsif play.complete?
      "stopwatch"
    else
      "stop-circle"
    end

    content_tag( :i, nil, class: "fa fa-#{icon} play-status-icon #{ play.status }" )

  end

end
