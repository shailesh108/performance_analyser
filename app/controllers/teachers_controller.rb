class TeachersController < ApplicationController
  before_action :authenticate_admin!
	before_action :set_teacher, only: [:edit, :update, :destroy]

	def edit
	end

  def list
   @teachers=Teacher.paginate(:page => params[:page], :per_page => 1)  
  end

	def update
		
		if @teacher.update(teacher_params)
    	  	redirect_to admin_teacher_list_path
    	  else
    	  	redirect_to admin_teacher_list_path
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
      params.require(:teacher).permit(:email,:password,:first_name,:middle_name,:last_name,:dateofbirth,:address,:city,:contactno)
    end

end
