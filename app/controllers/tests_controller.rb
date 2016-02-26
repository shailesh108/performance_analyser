class TestsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :authenticate_student! ,only: [:show]
  before_action :set_test,except: [:index, :new, :create]

  def index
    @tests=current_teacher.tests.paginate(:per_page => 5, :page => params[:page])
  end

  def new
    @test=Test.new
  end

  def edit

  end

  def update
    if @test.update(test_params.merge(set_extra_params))
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
    @test = Test.new(test_params.merge(set_extra_params))
    if @test.save
      redirect_to tests_path 
    else
      render:'new'
    end
  end

  private
  def test_params
    params.require(:test).permit(:test_name,:test_datetime,:total_time,:no_of_questions)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_extra_params
    stand_subj_id = StandardSubject.where(standard_id: params[:standard_id], subject_id: params[:subject_id]).take.id
    extra_params = {:standard_subject_id => stand_subj_id, :teacher_id => current_teacher.id, :status => 0}
  end
end