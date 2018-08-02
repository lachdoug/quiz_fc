module ApplicationHelper

  def fa( icon )
    content_tag( :i, nil, class: "fa fa-#{icon}" ) 
  end

end
