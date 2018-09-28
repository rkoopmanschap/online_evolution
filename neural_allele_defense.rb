# neural gene that determines defense type selection

class NeuralAlleleDefense
	
	def initialize(dominance)
		@run_chance 				= rand(100).to_f / 100
		@counter_attack_chance 		= rand(100).to_f / 100
		@dominance 					= dominance

		sum = @run_chance + @counter_attack_chance
		
		@run_chance = @run_chance / sum 
		@counter_attack_chance = @counter_attack_chance / sum 
	end

end
