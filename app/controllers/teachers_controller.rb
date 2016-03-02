class TeachersController < ApplicationController
  before_action :authenticate_admin!,except: :welcome
  before_action :set_teacher, except: [:welcome,:list,:new,:create]
  before_action :authenticate_teacher!,only: :welcome

  def welcome
  end

  def edit
  end

  def new
    @teacher=Teacher.new
  end

  def list 
    if params[:query].blank?
    @teachers=Teacher.paginate(:per_page => 5, :page => params[:page])
  else
    @teachers = Teacher.search_by_subject(params[:query]).paginate(:per_page => 5, :page => params[:page])
  end
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
    @avatar_path=("/avatars/teachers/originals/"+@teacher.avatar_file_name)
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:email,:password,:password_confirmation,:first_name,:middle_name,:last_name,:dateofbirth,:address,:city,:contactno,:gender,:avatar,:sub_name)
  end

end