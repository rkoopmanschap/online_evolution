# initializes a population

class Initializer

	def self.create_new_population
		@gene_pool 	= GenePool.new
		@population = Population.new


	end

end
