load './initializer.rb'

class OnlineEvolution

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

	def visualize
		puts "=================="
		@species.each do |species|
			species.print
		end
		puts "=================="
	end

	def process_generation
		GENERATION_DURATION.times do
			animals = collect_animals
			actions = determine_actions(animals)
			process_actions(animals, actions)
		end
	end

	def collect_animals
		result = []

		@species.each do |species|
			result += species.animals
		end

		return result
	end

	def determine_actions(animals)
		actions = { 
			gather_plants: [],
			gather_insects: [],
			gather_fish: [],
			attack: []
		}

		animals.each do |animal|
			action = animal.determine_action
			actions[action].push(animal)
		end

		return actions
	end

	def process_actions(animals, actions)
		total_plants_gathered = 0
		actions[:gather_plants].each do |animal|
			total_plants_gathered += animal.gather_plants
		end
		total_plants -= total_plants_gathered
		# TODO: rekening houden met max hoeveelheid. Gathered = max, minder als het totaal aantal planten naar 0 gaat

		total_fish_gathered = 0
		actions[:gather_fish].each do |animal|
			total_fish_gathered += animal.gather_fish
		end
		total_fish -= total_fish_gathered

		total_insects_gathered = 0
		actions[:gather_insects].each do |animal|
			total_insects_gathered += animal.gather_insects
		end
		total_insects -= total_insects_gathered

		actions[:attack].each do |animal|
			target = select_target(animal, animals)
			process_battle!(animal, target)
		end
	end

	def select_target(animal, animals)
		# TODO: niet eigen soort, pak potential animals op basis van lage camoflage
		# TODO: Gebruik neural gene voor target selection
		# TODO: not dead
		return animals.sample(1)
	end

	def process_battle(animal, target)
		defense_action = animal.choose_defense_action
		if defense_action == :run
			# TOOD: put in proper formula
			if(animal.speed > target.speed)
				if(animal.attack > (target.armor / 2))
					animal.gathered_food += target.nutrition
					target.dead = true
				end
			end
		elsif defense_action == :counter_attack
			animal_hurt = false
			target_hurt = false
			# TODO: put in proper formula
			if(animal.attack > target.armor)
				target_hurt = true
			if(animal.armor < target.attack)
				animal_hurt = true
			end

			if(target_hurt && !animal_hurt)

			elsif(animal_hurt && !target_hurt)

			elsif(!animal_hurt && !target_hurt)

			elsif(animal_hurt && target_hurt)
				
			end
		end
	end

	def process_evolution
		# for each species, get all surviving animals
		# calculate fitness
		# select parents
		# recombine
		# mutate
	end

	def generate_animal_order
		result = []

		@species.each do |species|
			result += species
		end

		return result
	end

	# main loop
	def start
		visualize

		NUMBER_OF_GENERATIONS.times do |time|
			process_generation
			process_evolution
			visualize
		end
	end
end

online_evolution = OnlineEvolution.new 
online_evolution.start 
