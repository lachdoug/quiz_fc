class MarkdownRenderer

  require_relative 'markdown_renderer/custom_renderer'

  def initialize( raw )
    @raw = raw
  end

  attr_reader :raw

  def to_html
    renderer.render( @raw.to_s )
  end

  private

  def renderer
    Redcarpet::Markdown.new( RedcarpetCustomRenderer, filter_html: false, tables: true )
  end

end
