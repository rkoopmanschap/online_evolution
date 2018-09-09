# neural gene that determines attack target selection

class NeuralAlleleTarget
	
	def initialize
		@speed_multiplier	 	= rand(100).to_f / 100
		@attack_multiplier	 	= rand(100).to_f / 100
		@nutrition_multiplier	= rand(100).to_f / 100

		@speed_actual_multiplier = @speed_multiplier - 0.5
		@attack_actual_multiplier = @attack_multiplier - 0.5
		@nutrition_actual_multiplier = @nutrition_multiplier - 0.5
	end

	def calculate_target_score(speed, attack, nutrition)
		return (speed * @speed_actual_multiplier) + (attack * @attack_actual_multiplier) + (nutrition * @nutrition_actual_multiplier)
	end

end
