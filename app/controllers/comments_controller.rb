class CommentsController < ApplicationController

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @comment = @conversation.comments.create(comment_params)
    redirect_to conversation_path(@conversation)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
