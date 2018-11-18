class Animal

	attr_reader :species
	attr_accessor :wounds, :dead, :fitness

	def initialize(genome, species)
		@genome = genome
		@species = species

		# Set physical attributes
		dominant_physical_alleles = genome.dominant_physical_alleles

		# add random bonus?
		@gather_plants 	= 0
		@gather_insects	= 0
		@gather_fish	= 0
		@attack			= 0
		@armor			= 0
		@camouflage		= 0
		@speed			= 0
		@nutrition		= 0
		@cost			= 0

		@wounds = 0
		@dead = false
		@fitness = 0

		dominant_physical_alleles.each do |dominant_physical_allele|
			@gather_plants 	+= dominant_physical_allele.gather_plants
			@gather_insects += dominant_physical_allele.gather_insects
			@gather_fish 	+= dominant_physical_allele.gather_fish
			@attack 		+= dominant_physical_allele.attack
			@armor 			+= dominant_physical_allele.armor
			@camouflage 	+= dominant_physical_allele.camouflage
			@speed 			+= dominant_physical_allele.speed
			@nutrition 		+= dominant_physical_allele.nutrition
			@cost 			+= dominant_physical_allele.cost
		end

		# Set neural attributes
		dominant_neural_allele_action 	= genome.dominant_action_neural_allele
		dominant_neural_allele_defense = genome.dominant_defense_neural_allele
		dominant_neural_allele_target 	= genome.dominant_target_neural_allele

		# neural gene action
		@gather_plants_cumulative_chance 	= dominant_neural_allele_action.gather_plants_cumulative_chance
		@gather_insects_cumulative_chance 	= dominant_neural_allele_action.gather_insects_cumulative_chance
		@gather_fish_cumulative_chance	 	= dominant_neural_allele_action.gather_fish_cumulative_chance
		@attack_cumulative_chance 			= dominant_neural_allele_action.attack_cumulative_chance

		# neural gene defense
		@run_cumulative_chance 			= dominant_neural_allele_defense.run_cumulative_chance
		@counter_attack_cumulative_chance 	= dominant_neural_allele_defense.counter_attack_cumulative_chance

		# neural gene target
		@speed_multiplier	 	= dominant_neural_allele_target.normalized_speed_multiplier
		@attack_multiplier	 	= dominant_neural_allele_target.normalized_attack_multiplier
		@nutrition_multiplier	= dominant_neural_allele_target.normalized_nutrition_multiplier
	end

	def calculate_target_score(target_animal)
		return (target_animal.effective_speed * @speed_multiplier) + (target_animal.effective_attack * @attack_multiplier) + (target_animal.effective_nutrition * @nutrition_multiplier)
	end

	def choose_defense_action
		number = rand(100).to_f / 100

		if(number < @run_cumulative_chance)
			return :run
		else
			return :counter_attack
		end
	end

	def determine_action
		return :dead if @dead

		number = rand(100).to_f / 100

		if number < @gather_plants_cumulative_chance then return :gather_plants
		elsif number < @gather_insects_cumulative_chance then return :gather_insects
		elsif number < @gather_fish_cumulative_chance then return :gather_fish
		else return :attack
		end
	end

	def effective_camouflage
		result = @camouflage
		result = add_wound_effect(result)
		result = add_random_effect(result)
		return [result, 0].max
	end

	def effective_speed
		result = @speed
		result = add_wound_effect(result)
		result = add_random_effect(result)
		return [result, 0].max
	end

	def effective_attack
		result = @attack
		result = add_wound_effect(result)
		result = add_random_effect(result)
		return [result, 0].max
	end

	def effective_armor
		result = @armor
		result = add_wound_effect(result)
		result = add_random_effect(result)
		return [result, 0].max
	end

	def effective_fitness
		result = @fitness
		result = add_wound_effect(result)
		result = add_random_effect(result)
		return [result, 0].max
	end

	def effective_gather_plants
		return @gather_plants
	end

	def effective_gather_insects
		return @gather_insects
	end

	def effective_gather_fish
		return @gather_fish
	end

	def effective_nutrition
		return @nutrition
	end

	def effective_cost
		return @cost
	end

	def print
		puts "gather_plants = #{@gather_plants}"
		puts "gather_insects = #{@gather_insects}"
		puts "gather_fish = #{@gather_fish}"
		puts "attack = #{@attack}"
		puts "armor = #{@armor}"
		puts "camouflage = #{@camouflage}"
		puts "speed = #{@speed}"
		puts "nutrition = #{@nutrition}"
		puts "cost = #{@cost}"
		puts "gather_plants_cumulative_chance = #{@gather_plants_cumulative_chance}"
		puts "gather_insects_cumulative_chance = #{@gather_insects_cumulative_chance}"
		puts "gather_fish_cumulative_chance = #{@gather_fish_cumulative_chance}"
		puts "attack_cumulative_chance = #{@attack_cumulative_chance}"
		puts "run_cumulative_chance = #{@run_cumulative_chance}"
		puts "counter_attack_cumulative_chance = #{@counter_attack_cumulative_chance}"
		puts "speed_multiplier = #{@speed_multiplier}"
		puts "attack_multiplier = #{@attack_multiplier}"
		puts "nutrition_multiplier = #{@nutrition_multiplier}"
	end

	# ===================
			private
	# ===================

	def add_wound_effect(value)
		value * (1 - (0.2 * @wounds))
	end

	def add_random_effect(value)
		number = (rand(50).to_f - 25) / 100
		return value * number
	end

end
