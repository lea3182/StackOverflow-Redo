class AnswersController < ApplicationController

  def create
    p params
    @question = Question.find(params[:question_id])
    @answer = Answer.create!(title: params[:answer][:title],
                         content: params[:answer][:content],
                         question_id: @question.id)

    # if @answer.save
      redirect_to question_path(@question) #@question works tor
    # else
    #   redirect_to answers_path
    # end
  end
  def show
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update(title: params[:answer][:title],
                   content: params[:answer][:content])

    redirect_to @question
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy

    redirect_to @question
  end
end
