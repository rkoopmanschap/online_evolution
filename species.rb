class Species

	def initialize(gene_pool)
		@animals = []

		# assign initial allele likelihood
		available_genes = select_genes(gene_pool)

		NUMBER_OF_ANIMALS.times do
			genome = available_genes.make_genome
			@animals << Animal.new(genome)
		end
	end

	# takes all genes and returns a subset of them
	def select_genes(gene_pool)

	end

	# takes a subset of genes and returns a genome for a single animal
	def make_genome(available_genes)

	end

end
