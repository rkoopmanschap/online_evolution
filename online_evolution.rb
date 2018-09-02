class OnlineEvolution

	NUMBER_OF_SPECIES = 3
	NUMBER_OF_ANIMALS = 100

	def initialize
		@max_generations = 500
		@population = nil
	end

	# main loop
	def start
		@population = Population.create_population(NUMBER_OF_SPECIES, NUMBER_OF_ANIMALS)
		
		@max_generations.times do |time_step|
			@population.process_generation
		end

		@population.print
	end
end


online_evolution = OnlineEvolution.new 
online_evolution.start 
