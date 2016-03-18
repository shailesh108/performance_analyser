require 'faker'
 namespace :student  do
  desc "create some fake data"
  task :greet => :environment do
		(1..9).each do |i|
     ccc = Student.create(email:"student#{i}@gmail.com" ,address: "samyak",city:"jamnagar", contactno:"9537156268" ,first_name:"Nidhi#{i}",middle_name:"A",last_name:"Faldu",standard_id:1,enrollment_no:"20165000#{i}")
   	puts ccc.errors.full_messages
   	puts "Hello"
    end
  end
end