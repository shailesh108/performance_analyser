class QuestionsController < ApplicationController
  before_action: authenticate_teacher!
  
  def index
   @questions = Question.all
   end
   def new
   @question = Question.new
   end
   def create
   @question = Question.new(params_arg)
    if @question.save
       render:'show'
     else 
         render:'new'
       end
    end
    def edit
	  @question = Question.find(params[: id])
    end
    def update
	  @question = Question.find(params[: id])
        if @question.update(params_arg)
          render:'show'
        else render:'edit'
        end
    end
    def destroy
	  @question = Question.find(params[: id])
	  @question.destroy
      redirect_to questions_path
     end
     def show
	  @question = Question.find(params[: id])
    end
    private
    def params_arg
       params.require(:question).permit(:test_id, :question, :option1, :option2, :option3,:option4,:answer)
    end
end