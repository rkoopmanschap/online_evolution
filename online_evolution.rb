class OnlineEvolution

	def initialize
		@max_generations = 500
		@species = []
	end

	# main loop
	def start
		@population = Initializer.create_new_population

		# @population = Population.create_population(NUMBER_OF_SPECIES, NUMBER_OF_ANIMALS)
		
		@max_generations.times do |time_step|
			@population.process_generation
		end

		@population.print
	end
end

online_evolution = OnlineEvolution.new 
online_evolution.start 
