module MarkdownsHelper

  def markdown( text )
    MarkdownRenderer.new( text, { view_context: self } ).to_html.html_safe
  end

end
