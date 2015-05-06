class AnswersController < ApplicationController

  def create
    p params
    @question = Question.find(params[:question_id])
    @answer = Answer.create!(title: params[:answer][:title],
                         content: params[:answer][:content],
                         question_id: @question.id)

    redirect_to question_path(@question) #@question works tor
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

  def upvote
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.upvotes

    redirect_to question_path(@question)
  end

  def downvote
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.downvotes

    redirect_to question_path(@question)
  end


end
