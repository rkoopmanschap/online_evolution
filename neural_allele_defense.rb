# neural gene that determines defense type selection

class NeuralAlleleDefense
	
	attr_reader :dominance, :run_cumulative_chance, :counter_attack_cumulative_chance

	def initialize(dominance)
		@run_chance 				= rand(100).to_f / 100
		@counter_attack_chance 		= rand(100).to_f / 100
		@dominance 					= dominance

		sum = @run_chance + @counter_attack_chance
		
		@run_chance = @run_chance / sum 
		@counter_attack_chance = @counter_attack_chance / sum 

		@run_cumulative_chance = @run_chance
		@counter_attack_cumulative_chance = @counter_attack_chance + @run_cumulative_chance
	end

	def to_s
		puts "@run_chance                               = #{@run_chance.round(2)}"
		puts "@counter_attack_chance                    = #{@counter_attack_chance.round(2)}"
		puts "@dominance                                = #{@dominance}"

		puts "@run_cumulative_chance             = #{@run_cumulative_chance.round(2)}"
		puts "@counter_attack_cumulative_chance  = #{@counter_attack_cumulative_chance}"
	end
end
