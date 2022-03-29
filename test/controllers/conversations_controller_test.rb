require "test_helper"

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @conversation = conversations(:two)
  end

  teardown do
    Rails.cache.clear
  end

  test "it should get all conversations" do
    get conversations_url
    assert_response :success
  end

  test "it should get a given conversation" do
    get conversations_url(@conversation)
    assert_response :success
  end

  test "it should create a conversation" do
    post conversations_url, params: { conversation: {title: "Test Three", body: "Lorem ipsum dolor"} }
    assert_equal "Test Three", Conversation.last.title
  end

  test "it should update a conversation" do
    patch conversation_url(@conversation), params: { conversation: { title: "Updated title"}}
    assert_redirected_to conversation_path(@conversation)
    @conversation.reload
    assert_equal "Updated title", @conversation.title
  end

  test "it should destroy a conversation" do
    assert_difference("Conversation.count", -1) do
      delete conversation_url(@conversation)
    end
  end

end
