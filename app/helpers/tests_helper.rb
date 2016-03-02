module TestsHelper
	def select_standard
		if @test.standard_subject == nil
			return 1
		else
			@test.standard_subject.standard.id
		end
	end

	def select_subject
		if @test.standard_subject == nil
			return 1
		else
			@test.standard_subject.subject.id
		end
	end

	def count_no_of_questions_remaining(test)
		return "Remaining : #{test.no_of_questions - test.questions.count}"
	end

	def change_add_question_glyphicon(test)
		unless (test.questions.count >= test.no_of_questions)
			return	"#{link_to "<i class='glyphicon glyphicon-plus' title='Add Questions'></i>".html_safe, new_test_question_path(test)}".html_safe
		else
			return "<i class='glyphicon glyphicon-thumbs-up' title='all Questions Added'></i>".html_safe
		end
	end

end
