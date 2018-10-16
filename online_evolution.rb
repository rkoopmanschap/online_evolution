load './initializer.rb'

class OnlineEvolution

	def initialize
		@species = []
		@gene_pool = GenePool.new

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
			animal_array = generate_animal_order
			animal_array.each do |animal|
				action = animal.pick_action
				perform_action(animal, action)
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

		# put all animals in array
		# shuffle
		# OR
		# shuffle while filling array

		return result
	end

	def perform_action(animal, action)
		case action
		when :gather_plants
			process_gather(animal, :plants)
		when :gather_insects
			process_gather(animal, :insects)
		when :gather_fish
			process_gather(animal, :fish)
		when :attack
			process_attack(animal)
		end
	end

	def process_gather(animal, type)
		# calculate_result
		# update animal
		# update type availability
	end

	def process_attack(animal)
		# select target
		# calculate_result
		# update animals
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
