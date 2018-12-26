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
		species = @world.species

		species.each_with_index do |single_species, index|
			surviving_animals = get_surviving_animals(single_species)
			surviving_animals.sort! { |animal| animal.fitness }
			total_fitness = surviving_animals.map { |animal| animal.fitness }.sum
			
			new_population = []
			NUMBER_OF_ANIMALS.times do |time|
				parents = select_parents(surviving_animals, total_fitness)
				child = generate_offspring(parents)
				new_population.push(child)
			end
			@world.replace_species(index, species)
		end
	end

	def get_surviving_animals(animals)
		return animals.select do |animal|
			animal.dead == false
		end
	end

	def select_parents(animals, total_fitness)
		animals = animals.dup
		father_selection = rand(total_fitness).to_f

		current_fitness = 0 

		animals.each do |animal|
			current_fitness += animal.fitness
			if(father_selection <= current_fitness)
				father = animal
			end
		end
		animals.delete(father)

		mother_selection = rand(total_fitness).to_f
		animals.each do |animal|
			current_fitness += animal.fitness
			if(mother_selection <= current_fitness)
				mother = animal
			end
		end

		return [father, mother]
	end

	def generate_offspring(mother, father)
		child_genome = recombine(mother, father)
		mutate(child_genome)
		return Animal.new(child_genome, father.species)
	end

	def recombine(mother, father)
		result_genome = Genome.new

		NUMBER_OF_PHYSICAL_GENES.times do |time|
			mother_allele = mother_genome[time].sample
			father_allele = father_genome[time].sample

			mother_allele = mutate(mother_allele, :physical_allele, time)
			father_allele = mutate(father_allele, :physical_allele, time)

			result_genome.add(:physical_allele, mother_allele, time)
			result_genome.add(:physical_allele, father_allele, time)
		end

		[:neural_allele_pair_action, :neural_allele_pair_target, :neural_allele_pair_defense].each do |gene_name|
			mother_allele = mother_genome[gene_name].sample
			father_allele = father_genome[gene_name].sample

			mother_allele = mutate(mother_allele, gene_name)
			father_allele = mutate(father_allele, gene_name)

			result_genome.add(gene_name, mother_allele)
			result_genome.add(gene_name, father_allele)
		end

		return result_genome
	end

	def mutate(child_allele, gene_name, physical_allele_number=nil)
		result_allele = child_allele

		result_allele = pick_new_allele(gene_name) if Util.rand >= MUTATION_CHANCE

		return result_allele 
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
