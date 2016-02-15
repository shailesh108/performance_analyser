class StudentsController < ApplicationController
	before_action :authenticate_teacher!,only: [:edit,:update,:destory,:list]
	before_action :set_student, only: [:edit, :update, :destroy]

	def edit
	end


	def update
		
		if @student.update(student_params)
    	  	redirect_to list_student_path
    	  else
    	  	redirect_to edit_student_path
      	end

	end


	def destroy
    @student.destroy
     	redirect_to list_student_path
   	end
   	def list 
		 @students=Student.all
	end
	

private
 def set_student
      @student = Student.find(params[:id])
    end

 def student_params
      params.require(:student).permit(:email,:password,:first_name,:middle_name,:last_name,:date_of_birth,:address,:city,:contactno,:standard_id)
    end



end
