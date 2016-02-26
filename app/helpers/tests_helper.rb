module TestsHelper
  def question_counter(test)
    if test.questions.count < test.no_of_questions
      return true
    end
  end
  def question_link(test)
    return "View "+test.questions.count.to_s+" Question"
  end

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
end
