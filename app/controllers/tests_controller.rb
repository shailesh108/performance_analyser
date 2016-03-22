class TestsController < ApplicationController
  before_action :authenticate_teacher!,except:[:testslist]
  before_action :authenticate_student! ,only: [:show,:testslist]
  before_action :set_test,except: [:index, :new, :create,:testslist]

  def index
    @tests=current_teacher.tests.where("test_datetime>=?",DateTime.now).paginate(:per_page => 4, :page => params[:page])
    @tests_completed=current_teacher.tests.where("test_datetime<=?",DateTime.now)
  end

  def new
    @test=Test.new
  end

  def edit

  end
  def testslist
    if params[:id1]=="1"
    @tests=current_student.standard.tests.joins(:results).where(:results =>{student_id:current_student.id}).order(test_datetime: :desc).paginate(:per_page => 10, :page => params[:page])
    @status=1
    elsif params[:id1]=="2"
    @tests=current_student.standard.tests.order(test_datetime: :desc).reject {|test| test.results.where(student_id:current_student.id).present? == (test.test_datetime<DateTime.now)}
     @status=2
    elsif params[:id1]=="3"
    @tests=current_student.standard.tests.where('test_datetime >= ?',DateTime.now).paginate(:per_page => 10, :page => params[:page])
    @status=3
    end
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