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
			link_to("<i class='glyphicon glyphicon-plus'></i>".html_safe, new_test_question_path(test), title: "Add Questions [#{count_no_of_questions_remaining(test)}]")			
		else
			return "<i class='glyphicon glyphicon-thumbs-up' title='all Questions Added'></i>".html_safe
		end
	end

	def test_name(id1)
		return Test.find_by(:id=>id1).test_name
	end
end
