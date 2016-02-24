class Question < ActiveRecord::Base
  validates :question, :option1, :option2, :option3, :option4, :answer, presence:true
  belongs_to:test
end
