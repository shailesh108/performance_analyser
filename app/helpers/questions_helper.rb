module QuestionsHelper
	def add_question_button(f)
		unless (@test_id.questions.count >= @test_id.no_of_questions) 
			return f.submit("Add Question",{:class=> 'btn btn-success'}) 
		else
			return "<h4>All Questions Added</h4>".html_safe
		end
	end

	def link_to_new_question
		unless (@test_id.questions.count >= @test_id.no_of_questions) 
			return	"#{link_to 'Add Question' , new_test_question_path, :class => "btn btn-success"}".html_safe	
		else
			return "<h4>All Questions Added</h4>".html_safe
		end
	end
end