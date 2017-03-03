class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update, :detroy]
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_ransack

  def index 
    if params[:q].present?
      @questions = @search.result
    else
      @questions = Question.all
    end
  end

  def show
    @answers = @question.answers
  end

  def edit
  end
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(id: @question.id)
    else
      flash[:alert] = "The question has not been created, due an error"
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to question_path
    else
      flash[:alert] = "The question has not been edited, due an error"
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private
  
    def set_question
      @question = Question.find(params[:id])
    end

    def set_ransack
      @search = Question.search(params[:q])
    end

    def question_params
      params.require(:question).permit(:title, :content, :user_id)
    end

end
