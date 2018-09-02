class Population

	def initialize(number_of_species, number_of_animals)
		@number_of_species = number_of_species
		@number_of_animals = number_of_animals
	end

	def process_generation
		# for all species
	end

	def self.create_population(number_of_species, number_of_animals)
		population = Population.new(number_of_species, number_of_animals)
		
		
	end

end
