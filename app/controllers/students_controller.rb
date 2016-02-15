class StudentsController < ApplicationController
  

  def index
    @students=Student.all
  end

  def new
    
    @student=Student.new
  end

  def edit
     @student = Student.find(params[:id])
  end
  def update
    @student = Student.find(params[:id])
    if @student.update(params_arg)
      render:'show'
    else
      render:'edit'
    end
  end
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
 
    redirect_to students_path

  end
  def show
    @student=Student.find(params[:id])
  end
  def create
    @student=Student.new(params_arg)
    if @student.save
      render:'show'
    else
      render:'new'
    end
  end

  private
  
  def params_arg
  params.require(:student).permit(:enrollment_no,:password,:password_confirmation,:first_name,:middle_name,:last_name,:date_of_birth,:address,:city,:contactno,:standard_id)

  end
end
