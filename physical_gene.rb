class PhysicalGene

	def initialize
		@alleles = []

		NUMBER_OF_ALLELES.times do
			@alleles << PhysicalAllele.new
		end
	end

end
