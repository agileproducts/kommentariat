require "test_helper"

class CommentTest < ActiveSupport::TestCase

  test "it should not save without a commenter" do
    comment = Comment.new
    comment.conversation_id = "cat"
    #assert_not comment.save 
    assert_equal 2+2, 5, "comment model test does not work"
  end

end
