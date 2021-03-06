class Genome

	attr_accessor :physical_allele_pairs, :neural_allele_pair_action, :neural_allele_pair_defense, :neural_allele_pair_target

	def initialize
		@physical_allele_pairs 		= []
		NUMBER_OF_PHYSICAL_GENES.times { @physical_allele_pairs.push([]) }
		@neural_allele_pair_action 	= []
		@neural_allele_pair_defense = []
		@neural_allele_pair_target	= []
	end

	def add(allele_name, allele, number=nil)
		case allele_name
		when :neural_allele_pair_action
			@neural_allele_pair_action.push(allele)
		when :neural_allele_pair_target
			@neural_allele_pair_target.push(allele)
		when :neural_allele_pair_defense
			@neural_allele_pair_defense.push(allele)
		when :physical_allele
			@physical_allele_pairs[number].push(allele)
		end
	end

	def dominant_physical_alleles
		result = []

		@physical_allele_pairs.each do |physical_allele_pair|
			result.push(physical_allele_pair.max_by { |allele| allele.dominance })
		end

		return result
	end

	def dominant_action_neural_allele
		return @neural_allele_pair_action.max_by { |allele| allele.dominance }
	end

	def dominant_defense_neural_allele
		return @neural_allele_pair_defense.max_by { |allele| allele.dominance }
	end

	def dominant_target_neural_allele
		return @neural_allele_pair_target.max_by { |allele| allele.dominance }
	end

end
