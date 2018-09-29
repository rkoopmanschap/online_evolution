class Species

	def initialize(gene_pool)
		@animals = []

		# assign initial allele likelihood
		available_genes = gene_pool.select_genes

		NUMBER_OF_ANIMALS.times do
			genome = available_genes.make_genome
			@animals << Animal.new(genome)
		end
	end

	# takes a subset of genes and returns a genome for a single animal
	def make_genome(available_genes)
		genome = Genome.new

		genome.add(:neural_allele_pair_action, available_genes[:action_neural_alleles].sample(1))
		genome.add(:neural_allele_pair_action, available_genes[:action_neural_alleles].sample(1))

		genome.add(:neural_allele_pair_target, available_genes[:target_neural_alleles].sample(1))
		genome.add(:neural_allele_pair_target, available_genes[:target_neural_alleles].sample(1))

		genome.add(:neural_allele_pair_defense, available_genes[:defense_neural_alleles].sample(1))
		genome.add(:neural_allele_pair_defense, available_genes[:defense_neural_alleles].sample(1))

		NUMBER_OF_PHYSICAL_GENES.times do |time|
			genome.add("physical_allele_#{time}".to_sym, available_genes["physical_allele_#{time}".to_sym].sample(1))
			genome.add("physical_allele_#{time}".to_sym, available_genes["physical_allele_#{time}".to_sym].sample(1))
		end

		return genome
	end

end
