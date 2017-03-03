class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def edit
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
    else
      flash[:alert] = "The answer hasn't been created, due a system error"
    end
    redirect_to question_path(id: params[:answer][:question_id])
  end

  def update
    if @answer.update(answer_params)
    else
      flash[:alert] = "The answer hasn't been edited, due a system error"
    end
    redirect_to question_path(id: params[:answer][:question_id])
  end
  
  def destroy
    @answer.destroy
    redirect_to question_path(id: params[:question_id])
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:content, :question_id, :id, :user_id)
    end
end