class QuestionsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :set_question ,only: [:edit,:update,:destroy,:show]

  def index
    @questions = Question.all
  end
  def new
    @question = Question.new
  end
  def create
    @question = Question.new(question_params)
    if @question.save
     redirect_to questions_path
    else 
      render :new
    end
  end
  def edit
  end
  def update
    if @question.update(question_params)
       redirect_to questions_path
    else
      render:'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def show
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end
  def question_params
    params.require(:question).permit(:question, :option1, :option2, :option3,:option4,:answer,:test_id)
  end
end