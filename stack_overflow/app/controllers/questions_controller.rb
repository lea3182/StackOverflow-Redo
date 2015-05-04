class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
  end

  def create
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.where(question_id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
