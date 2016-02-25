module TestsHelper
  def question_counter(test_id,no)
    if Question.where(:test_id=>test_id).count < no
      return true
    end
  end
  def question_link(test_id)
    return "View "+Question.where(:test_id=>test_id).count.to_s+" Question"
  end
end
