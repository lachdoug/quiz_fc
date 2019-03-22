module ApplicationHelper

  def fa( icon )
    content_tag( :i, nil, class: "fa fa-#{icon}" )
  end

  def banner( text )
    content_tag( :div, class: "app-banner" ) do
      content_tag( :div, text, class: "app-banner-text" ) +
      content_tag( :div, nil, class: "app-banner-underline" )
    end
  end

end
