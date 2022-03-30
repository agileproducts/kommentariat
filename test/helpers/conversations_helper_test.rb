require "test_helper"

class ConversationsHelperTest < ActionView::TestCase

    setup do
        @conversation = conversations(:markdown)
    end 

    test "it converts bold and italic" do
        assert_match "<p>I am <em>emphasis</em> and <strong>bold</strong></p>", md_to_html(@conversation.body)
    end

end