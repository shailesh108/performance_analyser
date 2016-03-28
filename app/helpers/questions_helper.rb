module QuestionsHelper
	def change_add_question_button(f)
		unless (@test_id.questions.count >= @test_id.no_of_questions) 
			return f.submit("Add question",{:class=> 'btn btn-success',:id=>"commit"}) 
		else
			return "<h4>All questions added</h4>".html_safe
		end
	end

	def disable_add_question_button
		return "<script>document.getElementById('commit').disabled = true;</script>".html_safe if @questions.count >= @test_id.no_of_questions
	end

	def question_link(test)
    return "View "+test.questions.count.to_s+" Question"
  end
end