require 'faker'
 namespace :teacher  do
  desc "create some fake data"
  task :greet => :environment do

    

    (1..15).each do |i|
     ccc = Teacher.create(email:"Teacher#{i}@gmail.com",address: "samyak",city:"jamnagar", contactno:"9537156268" ,first_name:"Teacher#{i}",middle_name:"A",last_name:"Faldu",gender:"female")
   	puts ccc.errors.full_messages
   	puts "Hello"
    end
 
  
 end
end
