class StudentsController < ApplicationController
  before_action :authenticate_teacher!,only: [:edit,:update,:destory,:list]
  before_action :authenticate_student!,only: [:welcome]
  before_action :set_student, only: [:edit, :update, :destroy,:show]
  def edit
  end
  def show
  end
  def new
    @student=Student.new
  end
  def create
    @student=Student.new(student_params)
      if @student.save
        redirect_to list_student_path
      else
        render :new
      end
  end
  def update
    if @student.update(student_params)
      redirect_to list_student_path
    else
      render :edit
    end
  end
  def welcome
  end
  def destroy
    @student.destroy
      redirect_to list_student_path
  end
  def list 
    @students=Student.paginate(:per_page => 4, :page => params[:page])
  end
  private
  def set_student
    @student = Student.find(params[:id])
  end
  def student_params
    params.require(:student).permit(:enrollment_no,:password,:email,:first_name,:middle_name,:last_name,:date_of_birth,:address,:city,:contactno,:standard_id)
  end
end