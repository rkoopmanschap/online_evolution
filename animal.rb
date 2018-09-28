class Animal

	def initialize(genome)
		# Set physical attributes
		@physical_allele_pairs = genome[:physical_allele_pairs] # 2 dimensional array of size (PHYSICAL_genome, 2)

		dominant_physical_alleles = Animal.get_dominant_genome(@physical_allele_pairs)

		# add random bonus?
		@gather_plants 	= 0
		@gather_insects	= 0
		@gather_fish	= 0
		@attack			= 0
		@armor			= 0
		@camouflage		= 0
		@speed			= 0

		@dominant_physical_alleles.each do |dominant_physical_allele|
			@gather_plants 	+= dominant_physical_allele.gather_plants
			@gather_insects += dominant_physical_allele.gather_insects
			@gather_fish 	+= dominant_physical_allele.gather_fish
			@attack 		+= dominant_physical_allele.attack
			@armor 			+= dominant_physical_allele.armor
			@camouflage 	+= dominant_physical_allele.camouflage
			@speed 			+= dominant_physical_allele.speed
		end

		# Set neural attributes
		@neural_allele_pair_action 	= genome[:neural_allele_pair_action] # array of 2 alleles
		@neural_allele_pair_defense = genome[:neural_allele_pair_defense]
		@neural_allele_pair_target 	= genome[:neural_allele_pair_target]

		dominant_neural_allele_action = Animal.get_dominant_alleles([@neural_allele_action_pair_action])[0]
		dominant_neural_allele_defense = Animal.get_dominant_alleles([@neural_allele_action_pair_defense])[0]
		dominant_neural_allele_target = Animal.get_dominant_alleles([@neural_allele_action_pair_target])[0]s

		# neural gene action
		@gather_plants_chance 	= dominant_neural_allele_action.gather_plants_chance
		@gather_insects_chance 	= dominant_neural_allele_action.gather_insects_chance
		@gather_fish_chance	 	= dominant_neural_allele_action.gather_fish_chance
		@attack_chance 			= dominant_neural_allele_action.attack_chance

		# neural gene defense
		@run_chance 			= dominant_neural_allele_defense.run_chance
		@counter_attack_chance 	= dominant_neural_allele_defense.counter_attack_chance

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

	# ===================
			private
	# ===================

	def self.get_dominant_alleles(allele_pairs)
		result = []

		allele_pairs.each do |allele_pair|
			result << (allele_pair[0].dominance > allele_pair[1].dominance) ? allele_pair[0] : allele_pair[1]
		end

		return result
	end

end
