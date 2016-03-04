class ResultsController < ApplicationController
  before_action :authenticate_student!,only: [:test_result]
  before_action :set_test,only: [:show_result]

  def show_result
  end
  
  def test_result
    @result=Result.new
    @result.student_id=current_student.id
    @result.test_id=params[:id]
    @result.attempted_question=params.size-6 < 0 ? 0 : (params.size-6)
    correct=0
    qu=Question.where(:test_id=>params[:id])
    total=qu.count
    qu.each do |q|
      if params[q.id.to_s]==q.answer
        correct=correct+1    
      end
    end
    @result.correct_question=correct
    @result.incorrect_question=total.to_i-correct.to_i
    if @result.save
    else
    end
  end 

  private
  def set_test
    @test = Test.find(params[:id])
  end
end
