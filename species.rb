class Species

	def initialize(gene_pool)
		@animals = []

		# assign initial allele likelihood
		available_genes = gene_pool.select_genes

		NUMBER_OF_ANIMALS.times do
			genome = make_genome(available_genes)
			@animals << Animal.new(genome)
		end
	end

	def print
		@animals[0].print
	end


	# takes a subset of genes and returns a genome for a single animal
	def make_genome(available_genes)
		genome = Genome.new

		genome.add(:neural_allele_pair_action, available_genes[:action_neural_alleles].sample(1)[0])
		genome.add(:neural_allele_pair_action, available_genes[:action_neural_alleles].sample(1)[0])

		genome.add(:neural_allele_pair_target, available_genes[:target_neural_alleles].sample(1)[0])
		genome.add(:neural_allele_pair_target, available_genes[:target_neural_alleles].sample(1)[0])

		genome.add(:neural_allele_pair_defense, available_genes[:defense_neural_alleles].sample(1)[0])
		genome.add(:neural_allele_pair_defense, available_genes[:defense_neural_alleles].sample(1)[0])

		NUMBER_OF_PHYSICAL_GENES.times do |time|
			genome.add("physical_allele".to_sym, available_genes["physical_allele_#{time}".to_sym].sample(1)[0], time)
			genome.add("physical_allele".to_sym, available_genes["physical_allele_#{time}".to_sym].sample(1)[0], time)
		end

		return genome
	end

end
