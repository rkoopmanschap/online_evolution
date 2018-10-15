class Animal

	def initialize(genome)
		@genome = genome

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

		dominant_physical_alleles.each do |dominant_physical_allele|
			@gather_plants 	+= dominant_physical_allele.gather_plants
			@gather_insects += dominant_physical_allele.gather_insects
			@gather_fish 	+= dominant_physical_allele.gather_fish
			@attack 		+= dominant_physical_allele.attack
			@armor 			+= dominant_physical_allele.armor
			@camouflage 	+= dominant_physical_allele.camouflage
			@speed 			+= dominant_physical_allele.speed
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

	def calculate_target_score(speed, attack, nutrition)
		return (speed * @normalized_speed_multiplier) + (attack * @normalized_attack_multiplier) + (nutrition * @normalized_nutrition_multiplier)
	end

	def choose_defense_action
		number = rand(100).to_f / 100

		if(number < @run_chance)
			return :run
		else
			return :counter_attack
		end
	end

	def determine_action
		number = rand(100).to_f / 100

		if number < @gather_plants_cumulative_chance then return :gather_plants
		elsif number < @gather_insects_cumulative_chance then return :gather_insects
		elsif number < @gather_fish_cumulative_chance then return :gather_fish
		else return :attack
		end
	end

	# ===================
			private
	# ===================

end
