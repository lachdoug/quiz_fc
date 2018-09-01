class MarkdownRenderer

  def initialize( raw, options )
    @raw = raw
    @options = options
  end

  attr_reader :raw

  def to_html
    renderer.render( @raw.to_s )
  end

  private

  def renderer
    Redcarpet::Markdown.new( RedcarpetCustomRenderer, @options.merge( { filter_html: false, tables: true } ) )
  end

end
