class Person
	attr :name

	def initialize(name)
		@name = name
	end

	def greeting
		puts "Hi my name is: #{name}"
	end
end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an Object"
	end
end

Chris = Instructor.new("Chris")
Chris.greeting

Cristina = Student.new("Cristina")
Cristina.greeting

Chris.teach
Cristina.learn

#This won't work because Chris doesn't have access to the learn method, and Cristina doesn't have
# access to the teach method in either their respective classes, or the parent Person class.
Chris.learn
Cristina.teach