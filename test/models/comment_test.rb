require "test_helper"

class CommentTest < ActiveSupport::TestCase

  setup do
    @conversation = conversations(:two)
  end

  teardown do
    Rails.cache.clear
  end

  test "it should save with the correct attributes" do
    comment = Comment.new
    comment.conversation = @conversation
    comment.commenter = "Barney"
    comment.body = "Lorem ipsum"
    assert comment.save
  end

  test "it should not save without a commenter" do
    comment = Comment.new
    comment.conversation = @conversation
    comment.body = "Lorem ipsum"
    assert_not comment.save 
  end

  test "it should not save without a body" do
    comment = Comment.new
    comment.conversation = @conversation
    comment.commenter = "Barney"
    assert_not comment.save 
  end

end
