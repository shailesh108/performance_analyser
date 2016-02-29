class Question < ActiveRecord::Base
belongs_to :test
validates :question, :option1, :option2, :option3, :option4, :answer, presence:true

   belongs_to:test
   def self.import(file,test_id)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    total_ques=Test.find(test_id).no_of_questions
    available_ques=Test.find(test_id).questions.count
    (2..spreadsheet.last_row).each do |i|
      if available_ques<total_ques
        row = Hash[[header, spreadsheet.row(i)].transpose]
        question = find_by_id(row["id"]) || new
        question.attributes = row.to_hash.slice(*row.to_hash.keys)
        question.test_id=test_id
        question.save!
        available_ques+=1
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path,packed: false, file_warning: :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end

  end
end
