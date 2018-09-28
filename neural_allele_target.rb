# neural gene that determines attack target selection

class NeuralAlleleTarget
	
	def initialize(dominance)
		@speed_multiplier	 	= rand(100).to_f / 100
		@attack_multiplier	 	= rand(100).to_f / 100
		@nutrition_multiplier	= rand(100).to_f / 100
		@dominance 				= dominance

		@normalized_speed_multiplier = @speed_multiplier - 0.5
		@normalized_attack_multiplier = @attack_multiplier - 0.5
		@normalized_nutrition_multiplier = @nutrition_multiplier - 0.5
	end

end
