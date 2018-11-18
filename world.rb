class World

	attr_reader :species

	def initialize
		@species = []
		@gene_pool = GenePool.new

		@plants = STARTING_PLANTS
		@insects = STARTING_INSECTS
		@fish = STARTING_FISH

		NUMBER_OF_SPECIES.times do
			@species.push(Species.new(@gene_pool))
		end
	end

	# ====================
			public
	# ====================

	def print
		puts "================="
		puts "Printing world"
		puts "================="
		puts "@plants = #{@plants}"
		puts "@insects = #{@insects}"
		puts "@fish = #{@fish}"

		@species.each_with_index do |species, index|

		end
	end

	def animals
		result = []

		@species.each do |species|
			result += species.animals
		end

		return result.shuffle
	end

	def choose_and_perform_action(animal)
		action = animal.determine_action
		perform_action(animal, action)
	end

	def perform_action(animal, action)
		case action
		when :dead then process_dead(animal)
		when :gather_plants then process_gather_plants(animal)
		when :gather_fish then process_gather_fish(animal)
		when :gather_insects then process_gather_insects(animal)
		when :attack then process_attack(animal)
		end
	end

	def process_gather_plants(animal)
		eaten_plants = [animal.effective_gather_plants, @plants].min
		@plants -= eaten_plants
		animal.fitness += eaten_plants
	end

	def process_gather_fish(animal)
		eaten_fish = [animal.effective_gather_fish, @fish].min
		@fish -= eaten_fish
		animal.fitness += eaten_fish
	end

	def process_gather_insects(animal)
		eaten_insects = [animal.effective_gather_insects, @insects].min
		@insects -= eaten_insects
		animal.fitness += eaten_insects
	end

	def process_attack(animal)
		target = select_target(animal)
		process_battle!(animal, target)
	end

	def select_target(animal)
		potential_targets = []
		animals.each do |target_animal|
			potential_targets.push(animal) if(target_animal.species != animal.species && target_animal.dead == false)
		end

		potential_targets = potential_targets.sample(10)
		potential_targets_analysis = []

		potential_targets.each do |potential_target|
			potential_targets_analysis.push({
				animal: potential_target,
				camouflage: potential_target.effective_camouflage,
				target_score: animal.calculate_target_score(potential_target)
			})
		end

		potential_targets_analysis.sort_by! { |potential_target| potential_target[:camouflage] }
		max_camouflage_filtered = [potential_targets_analysis.size - 1, 5].min
		potential_targets_analysis = potential_targets_analysis[0..max_camouflage_filtered]
		potential_targets_analysis.sort_by! { |potential_target| potential_target[:target_score] }

		return potential_targets_analysis[0][:animal]
	end

	def process_battle!(animal, target)
		defense_action = animal.choose_defense_action
		if defense_action == :run
			if(animal.effective_speed > target.effective_speed)
				if(animal.effective_attack > (target.effective_armor / 2))
					animal.fitness += target.effective_nutrition
					target.dead = true
				end
				# target gets away
			end
			# target runs away
		elsif defense_action == :counter_attack
			animal_hurt = false
			target_hurt = false
			if(animal.effective_attack > target.effective_armor)
				target_hurt = true
			elsif(animal.effective_armor < target.effective_attack)
				animal_hurt = true
			end

			if(target_hurt && !animal_hurt)
				# target loses, dies and is eaten
				animal.fitness += target.effective_nutrition
				target.dead = true
			elsif(animal_hurt && !target_hurt)
				# target wins and get away
				animal.wounds += 1
			elsif(!animal_hurt && !target_hurt)
				# neither wins, nothing happens
			elsif(animal_hurt && target_hurt)
				# both are wounded, no food gained
				animal.wounds += 1
				target.wounds += 1
			end
		end
	end

	def process_dead(animal)
		# do nothing
	end

end
