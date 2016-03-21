class TeachersController < ApplicationController

  before_action :authenticate_admin!,except: [:welcome, :graph,:tests_graph,:studtestperformance]
  before_action :set_teacher, except: [:welcome,:list,:new,:create,:search,:search_result,:graph,:tests_graph,:studtestperformance]
  before_action :authenticate_teacher!,only: [:welcome,:tests_graph,:studtestperformance]


  def welcome
    redirect_to list_students_path
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
  def graph

  end
  def tests_graph
   
    name=Result.where(:test_id=>params[:id]).pluck(:student_id,:percentage).map{|s| Student.where(:id=>s).pluck(:first_name)}
    per=Result.where(:test_id=>params[:id]).pluck(:student_id,:percentage).map{|s,p| p}
    @result=name.zip(per)
    @rank=per.zip(name).sort!
    @rank.reverse!
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

  def search
  end

  def search_result
    if params[:standard_id] and params[:subject_id]!=nil
      stand_subj = StandardSubject.where(standard_id: params[:standard_id], subject_id: params[:subject_id]).take
      @standard = stand_subj.standard.name
      @subject = stand_subj.subject.sub_name
      
      stand_subj_id = stand_subj.id    
      teacher_assigned = TeacherStandardSubject.find_by(standard_subject_id: stand_subj_id)
      @teacher_profile = teacher_assigned.teacher
    end   
  end

    def studtestperformance
     att=Student.find(params[:stud][:id]).results
    testname=att.pluck(:test_id,:percentage).map{|a,k| Test.find(a).test_name}
    per = att.pluck(:percentage)
    @data1=testname.zip(per)
    render 'graph'
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:email,:password,:password_confirmation,:first_name,:middle_name,:last_name,:dateofbirth,:address,:city,:contactno,:gender,:avatar,:sub_name)
  end

  def assign_params
    stand_subj_id = StandardSubject.where(standard_id: params[:standard_id], subject_id: params[:subject_id]).take.id
    {:teacher_id => params[:id], :standard_subject_id => stand_subj_id}
  end
end