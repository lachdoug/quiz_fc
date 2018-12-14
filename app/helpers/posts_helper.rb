module PostsHelper

  def post_status_badge( post )

    content_tag( :span, class: "post-status #{ post.status }" ) do
      concat post_status_icon( post )
      concat " #{ post.status.to_s.humanize }"
    end

  end

  def post_status_icon( post )

    icon = if post.draft?
      "file"
    elsif post.published?
      "file-invoice"
    else
      "file-archive"
    end

    content_tag( :i, nil, class: "fa fa-#{icon} post-status-icon #{ post.status }" )

  end

end
