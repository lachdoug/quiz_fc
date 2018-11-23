module QuizbooksHelper

  def quizbook_status_badge( quizbook )

    content_tag( :span, class: "quizbook-status #{ quizbook.status }" ) do
      concat quizbook_status_icon( quizbook )
      concat " "
      concat "Published/" if quizbook.published?
      concat "#{ quizbook.status.to_s.humanize }"
    end

  end

  def quizbook_status_icon( quizbook )

    icon =
      if quizbook.draft?
        "file"
      elsif quizbook.ready?
        "file-invoice"
      elsif quizbook.finalised?
        "file-alt"
      else
        "file-archive"
      end

    content_tag( :i, nil, class: "fa fa-#{icon} quizbook-status-icon #{ quizbook.status }" )

  end

end
