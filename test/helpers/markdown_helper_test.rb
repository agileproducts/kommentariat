require "test_helper"

class MarkdownHelperTest < ActionView::TestCase

    setup do
        @conversation = conversations(:markdown)
    end 

    test "it converts bold and italic" do
        assert_match "<p>I am <em>emphasis</em> and <strong>bold</strong></p>", MarkdownHelper.md_to_html(@conversation.body)
    end

end