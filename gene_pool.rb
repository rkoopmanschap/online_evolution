class GenePool

	def initialize
		@physical_genes = []

		NUMBER_OF_PHYSICAL_GENES.times do
			@physical_genes << PhysicalGene.new
		end

		@action_neural_alleles = []
		@target_neural_alleles = []
		@defense_neural_alleles = []

		NUMBER_OF_ALLELES.times { |i| @action_neural_alleles << NeuralAlleleAction.new(i) }
		NUMBER_OF_ALLELES.times { |i| @target_neural_alleles << NeuralAlleleTarget.new(i) }
		NUMBER_OF_ALLELES.times { |i| @defense_neural_alleles << NeuralAlleleDefense.new(i) }
	end

	def print
		puts "Action Neural Genes:"
		@action_neural_alleles[0].to_s
		puts ""
		
		puts "target Neural Genes:"
		@target_neural_alleles[0].to_s
		puts ""

		puts "Defense Neural Genes:"
		@defense_neural_alleles[0].to_s
		puts ""

		puts "number of physical genes = #{@physical_genes.size}"
		puts "Physical Genes:"
		@physical_genes.each_with_index do |physical_gene, i|
			puts "Physical gene #{i}: "
			puts physical_gene.to_s
			puts ""
		end

		return nil
	end

	# takes all genes and returns a subset of them
	def select_genes
		result = {}

		result[:action_neural_alleles] = @action_neural_alleles.sample(10)
		result[:target_neural_alleles] = @target_neural_alleles.sample(10)
		result[:defense_neural_alleles] = @defense_neural_alleles.sample(10)

		NUMBER_OF_PHYSICAL_GENES.times do |time|
			result["physical_allele_#{time}".to_sym] = @physical_genes[time].alleles.sample(10)
		end

		return result
	end

end
