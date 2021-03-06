class StudentsController < ApplicationController

  before_action :authenticate_teacher_or_admin,except: [:welcome,:starttest,:result,:resultdata]
  before_action :authenticate_student!,only: [:welcome,:starttest,:result,:resultdata]
  before_action :set_student,except: [:welcome,:list,:new,:create,:starttest,:result,:resultdata,:studentcompare]
  before_action :set_test,only: [:starttest]


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

      enrolment_no=Time.now.year.to_s+@student.standard.name.to_s+("0".*(4-@student.id.to_s.length))+@student.id.to_s

      @student.update_attributes(enrollment_no: enrolment_no)

      redirect_to list_students_path
      
    else

      render :new

    end
  end
  def starttest
    
    @ques=@test.questions
  end

  def update
    if @student.update(student_params)
      redirect_to list_students_path
    else
      render :edit
    end
  end

  def welcome
       
       @avatar_path=("/avatars/students/originals/"+current_student.avatar_file_name)
    @complete_tests=current_student.standard.tests.joins(:results).where(:results =>{student_id:current_student.id}).order(test_datetime: :desc)

    @upcoming_tests=current_student.standard.tests.where('test_datetime>?',DateTime.now).order(test_datetime: :desc)                
    @not_attended_tests=current_student.standard.tests.order(test_datetime: :desc).reject {|test| test.results.where(student_id:current_student.id).present? == (test.test_datetime<DateTime.now)}
  end
  def resultdata
    @st=Result.find_by(:student_id=>current_student.id,:test_id=>params[:t_id])
      respond_to do |format|
        format.js    
      end
  end
  def studentcompare
    stu_1=Student.find(params[:first_stud][:id]).first_name 
    stu_1_res=Student.find(params[:first_stud][:id]).results 
    percentage=stu_1_res.average(:percentage) 
    stu_2=Student.find(params[:second_stud][:id]).first_name
    stu_2_res=Student.find(params[:second_stud][:id]).results 
    percentage1=stu_2_res.average(:percentage) 
    @graph={ stu_1=> percentage, stu_2=> percentage1} 
    respond_to do |format|
        format.js    
      end
  end
  

  def destroy
    @student.destroy
    redirect_to list_students_path
  end

  def list 
    
  if params[:query].blank?
    if params[:name].present?
     # byebug
       @students=Student.where(:standard_id=>params[:name][:id]).paginate(:per_page => 10, :page => params[:page])
       else
        @students=Student.paginate(:per_page => 10, :page => params[:page])
  end
  else
    @students = Student.search_by_standard_name(params[:query]).paginate(:per_page => 10, :page => params[:page])
  end
end


  def set_student
    @student = Student.find(params[:id])
  end
  def set_test
    @test=Test.find(params[:id])
  end
  def student_params
    params.require(:student).permit(:enrollment_no,:password,:email,:first_name,:middle_name,:last_name,:date_of_birth,:address,:city,:contactno,:standard_id,:gender,:avatar)
  end

  def authenticate_teacher_or_admin
    unless (current_teacher || current_admin)
      redirect_to root_path
    end
  end
end