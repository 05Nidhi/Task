require_relative 'School'
class Student
	include School
	def details
		puts "my name is nidhi"
		puts "my class is 10th"
	end
end
a=Student.new
puts a.organisation_name