module ApplicationHelper

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:line_numbers => :table)
    end
  end

  @@coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
  @@redcarpet = Redcarpet::Markdown.new(@@coderayified, {
    :fenced_code_blocks => true,
    :no_intra_emphasis  => true,
    :autolink           => true,
    :strikethrough      => true,
    :lax_html_blocks    => true,
    :superscript        => true
  })

  def markdown(text)
    @@redcarpet.render(text).html_safe
  end

end
