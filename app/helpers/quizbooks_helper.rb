module QuizbooksHelper

  def quizbook_status_badge( quizbook )

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

    content_tag( :span, class: "quizbook-status #{ quizbook.status }" ) do
      concat content_tag( :i, nil, class: "fa fa-#{icon} quizbook-status-icon #{ quizbook.status }" )
      concat " "
      concat "Published/" if quizbook.published?
      concat "#{ quizbook.status.to_s.humanize }"
    end

  end

end
