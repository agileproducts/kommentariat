class CommentsController < ApplicationController

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @comment = @conversation.comments.create(comment_params)
    redirect_to conversation_path(@conversation)
  end

  def update
    @conversation = Conversation.find(params[:conversation_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @conversation
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
