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

  test "it should update a comment" do
    post "#{conversation_path(@conversation)}/comments", params: { comment: @comment_params }
    post "#{conversation_path(@conversation)}/comments", params: { comment: @comment_params }
    cid = @conversation.comments[1].id
    patch "#{conversation_path(@conversation)}/comments/#{cid}", params: {comment: {body: "New text"}}
    assert_equal "New text", @conversation.comments[1].body
  end

end
