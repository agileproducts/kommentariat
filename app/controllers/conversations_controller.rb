class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation_params)

    if @conversation.save
      redirect_to @conversation
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @conversation = Conversation.find(params[:id])
  end

  def update
    @conversation = Conversation.find(params[:id])

    if @conversation.update(conversation_params)
      redirect_to @conversation
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def conversation_params
    params.require(:conversation).permit(:title, :body)
  end

end
