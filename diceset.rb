class DiceSet
	attr_reader :values
	def initialize
	end
	def roll(i)
		@values = []
		i.times do
			@values << rand(5)+1
		end
	end
end
