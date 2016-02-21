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
   if @teacher.avatar_file_name.present?
     rename_avatar
   end    
	
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

private

 def set_teacher
      @teacher = Teacher.find(params[:id])
  end

 def teacher_params
      params.require(:teacher).permit(:email,:password,:password_confirmation,:first_name,:middle_name,:last_name,:dateofbirth,:address,:city,:contactno,:gender,:avatar)
  end

  def rename_avatar
    ext = File.extname(@teacher.avatar_file_name).downcase
    @teacher.avatar_file_name = "#{@teacher.first_name}#{@teacher.last_name}#{ext}"
  end

end
