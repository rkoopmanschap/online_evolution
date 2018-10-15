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

	end

	def process_evolution

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
