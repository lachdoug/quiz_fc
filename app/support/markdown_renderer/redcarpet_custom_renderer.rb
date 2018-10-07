class MarkdownRenderer
  class RedcarpetCustomRenderer < Redcarpet::Render::HTML

    include ActionView::Helpers::AssetTagHelper

    # Override image to allow width/height
    def image(link, title, alt_text)
      if link =~ /^(.+?)\s*=+(\d+)(?:px|)$/
        # ![alt](url.png =100px)
        # ![alt](url.png =100)
        %(<img src="#{$1}" style="width: #{$2}px" alt="#{alt_text}">)
      elsif link =~ /^(.+?)\s*=+(\d+)(?:px|)x(\d+)(?:px|)$/
        # ![alt](url.png =30x50)
        %(<img src="#{$1}" style="width: #{$2}px; height: #{$3}px;" alt="#{alt_text}">)
      else
        %(<img src="#{link}" title="#{title}" alt="#{alt_text}">)
      end
    end

    def view_context
      @options[:view_context]
    end

    def preprocess(document)
      document = preprocess_file(document)
      document
    end

    def preprocess_file(document)
      regex = Regexp.compile(/\bfile\s*(\[\s*.*\s*\]|)\(\s*\#(\d+)\s*(\=\s*\d*\s*|)\)/)
      # file( #FILE_NUMBER =WIDTH(optional) )
      # e.g. file( #1 =300 )
      document.to_enum(:scan, regex).map { Regexp.last_match }.each do |match|
        document.gsub!( match.to_s, file_tag_for( match[2], width: match[3][1..-1], alt: match[1] ) )
      end
      document
    end

    def file_tag_for( file_number, options={} )

      question = view_context.instance_variable_get( :@question )
      return '' unless question
      file = question.files[ file_number.to_i - 1 ]
      return '' unless file

      if file.image?
        tag_options = {}
        tag_options = { width: "#{ options[:width] }px", alt: options[:width] }.merge tag_options
        view_context.image_tag file, tag_options
      elsif file.video?
        tag_options = { controls: true }
        tag_options = { width: "#{ options[:width] }px" }.merge tag_options
        view_context.video_tag view_context.rails_blob_path( file ), tag_options
      elsif file.audio?
        tag_options = { controls: true }
        tag_options = { width: "#{ options[:width] }px" }.merge tag_options
        view_context.audio_tag view_context.rails_blob_path( file ), tag_options
      else
        view_context.content_tag :p, "File of unknown type"
      end

    end

  end

end
