class TestsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :authenticate_student! ,only: [:show]
  before_action :set_test,except: [:index, :new, :create]

  def index
     @tests=Test.paginate(:per_page => 5, :page => params[:page])
  end

  def new
    @test=Test.new
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render:'edit'
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def show
  end

  def create
    #byebug
    @test=Test.new(test_params)
    if @test.save
      redirect_to tests_path 
    else
      render:'new'
    end
  end

  private
  def test_params
    params.require(:test).permit(:test_name,:test_datetime,:total_time,:no_of_questions,:status,:standard_subject_id,:teacher_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end