require "test_helper"

class ConversationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save without a title" do
    conversation = Conversation.new
    conversation.title = ""
    conversation.body = "this is long enough"
    assert_not conversation.save, "saved conversation without a title"
  end

end
