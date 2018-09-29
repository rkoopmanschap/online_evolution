# neural gene that determines attack target selection

class NeuralAlleleTarget
	
	def initialize(dominance)
		@speed_multiplier	 	= rand(200).to_f / 100
		@attack_multiplier	 	= rand(200).to_f / 100
		@nutrition_multiplier	= rand(200).to_f / 100
		@dominance 				= dominance

		@normalized_speed_multiplier = @speed_multiplier - 1
		@normalized_attack_multiplier = @attack_multiplier - 1
		@normalized_nutrition_multiplier = @nutrition_multiplier - 1
	end

	def to_s
		puts "@speed_multiplier                = #{@speed_multiplier.round(2)}"
		puts "@attack_multiplier               = #{@attack_multiplier.round(2)}"
		puts "@nutrition_multiplier            = #{@nutrition_multiplier.round(2)}"
		puts "@dominance                       = #{@dominance}"

		puts "@normalized_speed_multiplier     = #{@normalized_speed_multiplier.round(2)}"
		puts "@normalized_attack_multiplier    = #{@normalized_attack_multiplier.round(2)}"
		puts "@normalized_nutrition_multiplier = #{@normalized_nutrition_multiplier.round(2)}"
	end
end
