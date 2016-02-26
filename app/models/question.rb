class Question < ActiveRecord::Base
belongs_to :test
validates :question, :option1, :option2, :option3, :option4, :answer, presence:true
end
