class QuestionsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :set_question, except: [:new,:index,:create,:import]
  before_action :set_test,except: [:show,:destroy]
  before_action :set_questions, only: [:index,:new,:create]

  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(questions_params.merge(:test_id => params[:test_id]))

    if @question.save
      respond_to do |format|
        format.js
      end

    else 
      render:'new'
    end

  end
    def import
     Question.import(params[:file],@test_id.id)
     redirect_to test_questions_path
  end
  def edit
  end

  def update
    if @question.update(questions_params.merge(:test_id => params[:test_id]))
      redirect_to test_questions_path
    else 
      render:'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path
  end

  def show
  end

  private
  def questions_params
    params.require(:question).permit(:question, :option1, :option2, :option3,:option4,:answer)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test_id = Test.find(params[:test_id])
  end

  def set_questions
    @questions = @test_id.questions
  end

end