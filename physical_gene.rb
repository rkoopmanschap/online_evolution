class PhysicalGene

	def initialize
		@alleles = []

		NUMBER_OF_ALLELES.times do |i|
			@alleles << PhysicalAllele.new(i)
		end
	end

end
