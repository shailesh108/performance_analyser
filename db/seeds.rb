# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 subject= ["Maths","English","Science","Social Science"]

subject.each do |sub|
	Subject.create!(sub_name: "#{sub}")
 end
(5...12).each do |num|                                                       
   Standard.create!(name:num)     
 end 
Standard.all.each do |std|
	Subject.all.each do |sub|
		StandardSubject.create(standard_id:std.id,subject_id:sub.id)
	end
end
