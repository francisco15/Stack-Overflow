class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
    else
      flash[:alert] = "The comment hasn't been created, due a system error"
    end
    redirect_to question_path(id: params[:question_id])
  end

  def update
    if @comment.update(comment_params)
    else
      flash[:alert] = "The comment hasn't been edited, due a system error"
    end
    redirect_to question_path(id: params[:question_id])
  end

  def destroy
    @comment.destroy
    redirect_to question_path(id: params[:question_id])
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
    
    def comment_params
      params.require(:comment).permit(:content, :commentable_id, :commentable_type, :user_id)
    end
end
