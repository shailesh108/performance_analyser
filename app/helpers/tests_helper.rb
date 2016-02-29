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
end
