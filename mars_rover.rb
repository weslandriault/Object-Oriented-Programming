class MissionControl

	attr_accessor :plateaus

	def create_plateau(width, height)
	end

end

class Plateau
	attr_accessor :width , :height, :rovers

	def initialize(width, height)
		@width = width
		@height = height
		@rovers = []
	end

	def on_plateau?(rover)
		rover.x <= width && rover.x >= 0 && rover.y <= height && rover.y >= 0 
	end

	def add_rover(x, y, d)
		r = Rover.new(x, y, d, self)
		@rovers << r 
		r
	end

	def kill_rover(rover)
		@rovers.delete(rover)
	end

	def to_s
		"The width of this rover is: #{width}m, and the height of this plateau is #{height}m"
	end

end

class Rover
	attr_accessor :x, :y, :direction, :plateau

	def initialize(x, y, direction, plateau)
		@x = x
		@y = y
		@direction = direction
		@plateau = plateau
	end

	def alive?
		plateau.on_plateau? self
	end

	def dead?
		not alive?
	end

	def instruct_rover (instructions)
		instructions.each_char do |instruction|
			if instruction == "M"
				move
			elsif instruction == "L" || "R"
				turn(instruction)
			end
		end
	end

	def turn(turn_dir)
		ensure_aliveness!

		
		if direction == "N" && turn_dir == "L"
			@direction = "W"
		elsif direction == "N" && turn_dir == "R"
			@direction = "E"
		

		elsif direction == "E" && turn_dir == "L"
			@direction = "N"
		elsif direction == "E" && turn_dir == "R"
			@direction = "S"
		

		elsif direction == "S" && turn_dir == "R"
			@direction = "W"
		elsif direction == "S" && turn_dir == "L"
			@direction = "E"
		

		elsif direction == "W" && turn_dir == "R"
			@direction = "N"
		elsif direction == "W" && turn_dir == "L"
			@direction = "S"
		end

		puts self

	end

	def ensure_aliveness!
		raise "You fell off!" unless alive?
	end

	def move

		if direction == "N" then @y += 1
		elsif direction == "S" then @y -= 1
		elsif direction == "E" then @x += 1
		elsif direction == "W" then @x -= 1
		end

		ensure_aliveness!

		# if not @plateau.on_plateau?(self)
		# 	puts "DIED"
		# 	@plateau.kill_rover(self)
		# end

		puts self
	end

	def to_s
		"The current position of your rover is: (#{x}, #{y}, #{direction})"
	end
end

puts "What is the size of the plateau?"

width, height = gets.chomp.split
plateau = Plateau.new(width.to_i, height.to_i)


rover1 = plateau.add_rover(0, 0, "N")

puts
puts plateau
puts
puts "Now Where do you want the Mars rover to go?"
puts "M => Move"
puts "L => Turn Left"
puts "R => Turn Right"
user_instructions = gets.chomp.upcase
rover1.instruct_rover(user_instructions)


