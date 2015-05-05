class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
  end

  def create
    @question = Question.new(title: params[:question][:title],
                             content: params[:question][:content])

    if @question.save
      redirect_to root_path
    end

  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id])
    @answer = Answer.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
