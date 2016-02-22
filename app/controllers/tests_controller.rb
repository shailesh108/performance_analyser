class TestsController < ApplicationController
 before_action :authenticate_teacher! ,only: [:create,:update,:destory,:edit]
 before_action :authenticate_student! ,only: [:show]

def index
 @tests = Test.all
end

def new
@test=Test.new
end

def create
@test=Test.new(params_arg)
if @test.save
render:'show'
else
render:'new'
end
end

def edit
@test = Test.find(params[:id])
end

def update
@test = Test.find(params[:id])
if @test.update(params_arg)
render:'show'
else
render:'edit'
end
end

def destroy
@test = Test.find(params[:id])
@test.destroy
redirect_to questions_path
end

def show
@test=Test.find(params[:id])

end


private
def params_arg
params.require(:test).permit(:test_name,:test_datetime,:total_time,:no_of_questions,:status,:standard_subject_id,:teacher_id)
end
end