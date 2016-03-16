 require 'faker' 
namespace :student  do
  desc "create some fake data"
  task :greet => :environment do
  @images = Dir["#{RAILS_ROOT}/public/*.*"]
    

    (1..10).each do |i|
     ccc = Student.create(email:"abbccc@gmail.com",date_of_birth: 12/06/1995, address: "abc",city:"abc", contactno:"9537156268" ,avatar:"B.j",first_name:"abbccc",middle_name:"aa",last_name:"bbcc",standard_id:5, enrollment_no: i, password:"12345678")
    end
 
  
 end
end
