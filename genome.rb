class Genome

	attr_accessor :physical_allele_pairs, :neural_allele_pair_action, :neural_allele_pair_defense, :neural_allele_pair_target

	def initialize
		@physical_allele_pairs 		= {}
		@neural_allele_pair_action 	= []
		@neural_allele_pair_defense = []
		@neural_allele_pair_target	= []

	end

	def add(allele_name, allele)
		case allele_name
		when :neural_allele_pair_action
			
		when :neural_allele_pair_target
		when :neural_allele_pair_defense
		when :physical_allele_pairs
		end
	end

end
