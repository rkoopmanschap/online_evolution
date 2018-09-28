require 'neural_allele_action'
require 'neural_allele_attack'
require 'neural_allele_defense'

class GenePool

	def initialize
		@physical_genes = []

		NUMBER_OF_PHYSICAL_GENES.times do
			@physical_genes << PhysicalGene.new
		end

		@action_neural_alleles = []
		@attack_neural_alleles = []
		@defense_neural_alleles = []

		NUMBER_OF_ALLELES.times { |i| @action_neural_alleles << NeuralAlleleAction.new(i) }
		NUMBER_OF_ALLELES.times { |i| @attack_neural_alleles << NeuralAlleleAttack.new(i) }
		NUMBER_OF_ALLELES.times { |i| @defense_neural_alleles << NeuralAlleleDefense.new(i) }
	end

end
