require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @conversation = conversations(:two)
    @comment_params = {commenter: "Barney", body: "Lorem ipsum"}
  end

  teardown do
    Rails.cache.clear
  end

  test "it should create a comment" do
    starting_count = Comment.count
    post "#{conversation_path(@conversation)}/comments", params: { comment: @comment_params } 
    assert_redirected_to conversation_path(@conversation)
    assert_equal starting_count+1, Comment.count
  end

end
