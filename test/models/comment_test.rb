require "test_helper"

class CommentTest < ActiveSupport::TestCase

  test "it should not save without a commenter" do
    comment = Comment.new
    comment.conversation_id = 1
    assert_not comment.save 
  end

end
