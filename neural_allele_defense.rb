# neural gene that determines defense type selection

class NeuralAlleleDefense
	
	def initialize
		@run_chance 				= rand(100).to_f / 100
		@counter_attack_chance 	= rand(100).to_f / 100

		sum = @run_chance + @counter_attack_chance
		
		@run_chance = @run_chance / sum 
		@counter_attack_chance = @counter_attack_chance / sum 
	end

	def choose_defense_action
		number = rand(100).to_f / 100

		if(number < @run_chance)
			return :run
		else
			return :counter_attack
		end
	end

end
