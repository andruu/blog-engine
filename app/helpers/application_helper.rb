module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, :lexer => language)
    end
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(:hard_wrap => true)
    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :tables => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true,
      :filter_html => true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end