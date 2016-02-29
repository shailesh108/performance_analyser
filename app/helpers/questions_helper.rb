module QuestionsHelper
	def add_question_button(f)
		unless (@test_id.questions.count >= @test_id.no_of_questions) 
			return f.submit("Add Question",{:class=> 'btn btn-success'}) 
		else
			return "<h4>All Questions Added</h4>".html_safe
		end
	end

	def add_question_glyphicon(test)
		unless (test.questions.count >= test.no_of_questions)
			return	"#{link_to "<i class='glyphicon glyphicon-plus' title='Add Questions'></i>".html_safe, new_test_question_path(test)}".html_safe
		else
			return "<i class='glyphicon glyphicon-thumbs-up' title='all Questions Added'></i>".html_safe
		end
	end

	def question_link(test)
    return "View "+test.questions.count.to_s+" Question"
  end
end