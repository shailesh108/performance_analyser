class StudentsController < ApplicationController
	before_action :authenticate_teacher!,except: [:welcome]
	before_action :authenticate_student!,only: [:welcome]
	before_action :set_student,except: [:welcome,:list,:new,:create]
	
  def edit
	end
	
  def show
		
	end
	
  def new
		@student=Student.new
	end

	def create
   @student=Student.new(student_params)
	 if @student.avatar_file_name.present?
     rename_avatar
   end
   if @student.save
   
      no=Time.now.year.to_s+@student.standard_id.to_s+("0".*(4-@student.id.to_s.length))+@student.id.to_s

       @student.update_attributes(enrollment_no: no.to_s)
    		
        redirect_to list_students_path
   	else
      	
        	render :new
    	
    end

  end
	
  def update
		if @student.update(student_params)
    	  	redirect_to list_students_path
    	  else
    	  	render :edit
      	end
	end

 	def welcome
 	end

	def destroy
    	@student.destroy
     	redirect_to list_students_path
  end

  def list 
		 @students=Student.paginate(:per_page => 5, :page => params[:page])
	end

private

 	def set_student
      @student = Student.find(params[:id])
    end

	 def student_params
      params.require(:student).permit(:enrollment_no,:password,:email,:first_name,:middle_name,:last_name,:date_of_birth,:address,:city,:contactno,:standard_id,:gender,:avatar)
    end
  
  def rename_avatar
 
    ext = File.extname(@student.avatar_file_name).downcase.to_s
    @student.avatar_file_name = "#{@student.first_name}#{@student.last_name}#{ext}"

  end

end
