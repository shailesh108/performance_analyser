class TeachersController < ApplicationController
  before_action :authenticate_admin!,except: [:welcome]
  before_action :set_teacher, except: [:welcome,:list,:new,:create]
  before_action :authenticate_teacher!,only: [:welcome]

  def welcome
  end

  def edit
  end

  def new
    @teacher=Teacher.new
  end

  def list
    @teachers=Teacher.paginate(:page => params[:page], :per_page => 5)  
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to list_teachers_path
    else
      render :edit
    end

  end

  def create
    @teacher=Teacher.new(teacher_params)
    if @teacher.save
      redirect_to list_teachers_path
    else
      render :new
    end
  end

  def destroy
    @teacher.destroy
    redirect_to list_teachers_path
  end

  def show
  end

  def assign
    @teacher_standard_subject=TeacherStandardSubject.new
  end

  def assign_teacher
    @teacher_standard_subject = TeacherStandardSubject.new(assign_params)
    if @teacher_standard_subject.save
      redirect_to assign_teacher_path
    end
  end

  def delete_assignment
    teacher_standard_subject = TeacherStandardSubject.find(params[:assigned_id])
    teacher_standard_subject.destroy
    redirect_to assign_teacher_path
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:email, :password, :password_confirmation, :first_name, :middle_name, :last_name, :dateofbirth, :address, :city, :contactno, :gender, :avatar)
  end

  def assign_params
    stand_subj_id = StandardSubject.where(standard_id: params[:standard_id], subject_id: params[:subject_id]).take.id
    {:teacher_id => params[:id], :standard_subject_id => stand_subj_id}
  end
end