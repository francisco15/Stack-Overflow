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
  
end
