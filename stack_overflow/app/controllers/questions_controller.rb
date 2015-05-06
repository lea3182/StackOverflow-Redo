class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @question = Question.new
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
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(title: params[:question][:title],
                     content: params[:question][:content])

      redirect_to question_path(@question)
    else
      redirect_to edit_question_path
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to root_path
  end

end
