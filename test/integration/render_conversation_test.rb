require "test_helper"

class RenderConversationTest < ActionDispatch::IntegrationTest
  test "create and display conversation" do
    get "/conversations/new"
    assert_response :success

    post "/conversations", 
      params: { conversation: {title: "Test rendering", body: "I *am* **some** [markdown](link)"} }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", 'I <em>am</em> <strong>some</strong> <a href="link">markdown</a>'
  end
end
