load './initializer.rb'

class OnlineEvolution

	def initialize
		@world = World.new
	end

	def visualize
		@world.print
	end

	def process_generation
		GENERATION_DURATION.times do |generation_number|
			puts "doing generation #{generation_number}"
			animals = @world.animals
			take_actions(animals)
		end
	end

	def take_actions(animals)
		animals.each_with_index do |animal, index|
			puts "doing animal action: #{index}"
			@world.choose_and_perform_action(animal)
		end
	end

	def process_evolution
		# for each species
			# get surviving animals
			# sort on fitness
			# calculate total fitness
			# while not sufficient animals
				# generate number between 0 and total fitness
				# find animal with this with generated cumulative fitness
				# pick as parent
				# if parent is animal -> pick closest
				# when 2 animals selected: generate offspring
		# set old pop = new pop
	end

	def generate_offspring(mother, father)
		child_genome = recombine(mother, father)
		mutate(child_genome)
		return Animal.new(child_genome, father.species)
	end

	def recombine(mother, father)
		# for every gene
			# pick one from mother at random
			# pick one from father at random
		# return child genome
	end

	def mutate(child_genome)
		# for every gene
			# check whether mutation
			# pick new allele if so
	end

	# main loop
	def start
		puts "MAIN LOOP: VISUALIZE"
		visualize

		NUMBER_OF_GENERATIONS.times do |time|
			puts "MAIN LOOP: GENERATION LOOP: #{time}"
			process_generation
			puts "MAIN LOOP: GENERATION LOOP: PROCESS_GENERATION"
			process_evolution
			puts "MAIN LOOP: GENERATION LOOP: PROCESS_EVOLUTION"
			visualize
			puts "MAIN LOOP: GENERATION LOOP: VISUALIZE"
		end
	end
end

online_evolution = OnlineEvolution.new 
online_evolution.start 
