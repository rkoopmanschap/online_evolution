class GenePool

	def initialize
		@physical_genes = []

		NUMBER_OF_PHYSICAL_GENES.times do
			@physical_genes << PhysicalGene.new
		end

		@action_neural_alleles = []
		@attack_neural_alleles = []
		@defense_neural_alleles = []

		NUMBER_OF_ALLELES.times { @action_neural_alleles << NeuralAlleleAction.new }
		NUMBER_OF_ALLELES.times { @attack_neural_alleles << NeuralAlleleAttack.new }
		NUMBER_OF_ALLELES.times { @defense_neural_alleles << NeuralAlleleDefense.new }
	end

end
