
	desc 'Migrate users from legacy database to new database'
task migrate_students: :environment do
   (1..10).each do |i|
   	
   	 ccc = Student.create(email:"abbccc@gmail.com",date_of_birth: 12/06/1995, address: "abc",city:"abc", contactno:"9537156268" ,avatar: "#{Rails.root}/public/avatars/pa.jpg",first_name:"abbccc",middle_name:"aa",last_name:"bbcc",standard_id:5, enrollment_no: i, password:"12345678")
   	 puts ccc.errors.full_messages
   	 puts "Hello"
   end
 end
