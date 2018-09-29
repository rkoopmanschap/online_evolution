# neural gene that determines action selection

class NeuralAlleleAction

	def initialize(dominance)
		@gather_plants_chance 	= rand(100).to_f / 100
		@gather_insects_chance 	= rand(100).to_f / 100
		@gather_fish_chance	 	= rand(100).to_f / 100
		@attack_chance 			= rand(100).to_f / 100
		@dominance 				= dominance

		sum = @gather_plants_chance + @gather_insects_chance + @gather_fish_chance + @attack_chance
		
		@gather_plants_chance = @gather_plants_chance / sum 
		@gather_insects_chance = @gather_insects_chance / sum 
		@gather_fish_chance = @gather_fish_chance / sum 
		@attack_chance = @attack_chance / sum

		@gather_plants_cumulative_chance = @gather_plants_chance
		@gather_insects_cumulative_chance = @gather_insects_chance + @gather_plants_cumulative_chance
		@gather_fish_cumulative_chance = @gather_fish_chance + @gather_insects_cumulative_chance
		@attack_cumulative_chance = @attack_chance + @gather_fish_cumulative_chance
	end

	def determine_action
		number = rand(100).to_f / 100

		if number < @gather_plants_cumulative_chance then return :gather_plants
		elsif number < @gather_insects_cumulative_chance then return :gather_insects
		elsif number < @gather_fish_cumulative_chance then return :gather_fish
		else return :attack
		end
	end

	def to_s
		puts "@gather_plants_chance                = #{@gather_plants_chance.round(2)}"
		puts "@gather_insects_chance               = #{@gather_insects_chance.round(2)}"
		puts "@gather_fish_chance                  = #{@gather_fish_chance.round(2)}"
		puts "@attack_chance                       = #{@attack_chance.round(2)}"
		puts "@dominance                           = #{@dominance}"

		puts "@gather_plants_cumulative_chance     = #{@gather_plants_cumulative_chance.round(2)}"
		puts "@gather_insects_cumulative_chance    = #{@gather_insects_cumulative_chance.round(2)}"
		puts "@gather_fish_cumulative_chance       = #{@gather_fish_cumulative_chance.round(2)}"
		puts "@attack_cumulative_chance            = #{@attack_cumulative_chance.round(2)}"
	end

end
