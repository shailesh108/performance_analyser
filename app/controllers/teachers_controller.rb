class TeachersController < ApplicationController
  before_action :authenticate_admin!,only: [:edit,:update,:destory,:list]
  before_action :set_teacher, only: [:edit, :update, :destroy]
  def welcome
  end

  def edit
  end

  def new
    @teacher=Teacher.new
  end

  def list
   @teachers=Teacher.paginate(:page => params[:page], :per_page => 1)  
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to admin_teacher_list_path
    else
      render :edit
    end
  end
 
  def create
    @teacher=Teacher.new(teacher_params)
      if @teacher.save
        redirect_to admin_teacher_list_path
      else
       render :new
     end
  end

   def destroy
    @teacher.destroy
    redirect_to admin_teacher_list_path
   end

   private

   def set_teacher
     @teacher = Teacher.find(params[:id])
   end
 
   def teacher_params
     params.require(:teacher).permit(:email,:password,:password_confirmation,:first_name,:middle_name,:last_name,:dateofbirth,:address,:city,:contactno)
   end
end