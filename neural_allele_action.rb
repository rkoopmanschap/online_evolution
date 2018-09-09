# neural gene that determines action selection

class NeuralAlleleAction

	def initialize
		@gather_plants_chance 	= rand(100).to_f / 100
		@gather_insects_chance 	= rand(100).to_f / 100
		@gather_fish_chance	 	= rand(100).to_f / 100
		@attack_chance 			= rand(100).to_f / 100

		sum = @gather_plants_chance + @gather_insects_chance + @gather_fish_chance + @attack_chance
		
		@gather_plants_chance = @gatherPlantsChance / sum 
		@gather_insects_chance = @gather_insects_chance / sum 
		@gather_fish_chance = @gather_fish_chance / sum 
		@attack_chance = @attack_chance / sum

		@gather_plants_cumulative_chance = @gatherPlantsChance
		@gather_insects_cumulative_chance = @gather_insects_chance + @gather_plants_cumulative_chance
		@gather_fish_cumulative_chance = @gather_fish_chance + @gather_insects_cumulative_chance
		@attack_cumulative_chance = @attack_chance + @gather_fish_cumulative_chance
	end

	def determine_action
		number = rand(100).to_f / 100

		if number < @gather_plants_cumulative_chance then return :gather_plants
		elsif number < @gather_insects_cumulative_chance then return :gather_insects
		elsif number < @gather_fish_cumulative_chance then return :gather_fish
		else then return :attack
	end

end
