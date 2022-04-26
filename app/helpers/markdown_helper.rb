require "redcarpet"

module MarkdownHelper
    def self.md_to_html(string)
        renderer = Redcarpet::Render::HTML.new()
        markdown = Redcarpet::Markdown.new(renderer, extensions = {})
        markdown.render(string)
    end
end