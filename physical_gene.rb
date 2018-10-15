class PhysicalGene

	attr_reader :alleles

	def initialize
		@alleles = []

		NUMBER_OF_ALLELES.times do |i|
			@alleles << PhysicalAllele.new(self, i)
		end
	end

	def to_s
		total_gather_plants 	= 0
		total_gather_insects 	= 0
		total_gather_fish 		= 0
		total_attack			= 0
		total_armor		 		= 0
		total_camouflage	 	= 0
		total_speed		 		= 0
		total_dominance 		= 0
		total_cost		 		= 0
		total_nutrition			= 0
		total_dominance 		= 0

		@alleles.each do |allele|
			total_gather_plants 	+= allele.gather_plants
			total_gather_insects 	+= allele.gather_insects
			total_gather_fish 		+= allele.gather_fish
			total_attack			+= allele.attack
			total_armor		 		+= allele.armor
			total_camouflage	 	+= allele.camouflage
			total_speed		 		+= allele.speed
			total_dominance 		+= allele.dominance
			total_cost		 		+= allele.cost
			total_nutrition			+= allele.nutrition
			total_dominance 		+= allele.dominance
		end

		puts "total_gather_plants       = #{(total_gather_plants / NUMBER_OF_ALLELES).round(2)}"
		puts "total_gather_insects      = #{(total_gather_insects / NUMBER_OF_ALLELES).round(2)}"
		puts "total_gather_fish         = #{(total_gather_fish / NUMBER_OF_ALLELES).round(2)}"
		puts "total_attack              = #{(total_attack / NUMBER_OF_ALLELES).round(2)}"
		puts "total_armor               = #{(total_armor / NUMBER_OF_ALLELES).round(2)}"
		puts "total_camouflage          = #{(total_camouflage / NUMBER_OF_ALLELES).round(2)}"
		puts "total_speed               = #{(total_speed / NUMBER_OF_ALLELES).round(2)}"
		puts "total_dominance           = #{(total_dominance / NUMBER_OF_ALLELES).round(2)}"
		puts "total_nutrition           = #{(total_nutrition / NUMBER_OF_ALLELES).round(2)}"
		puts "total_cost                = #{(total_cost / NUMBER_OF_ALLELES).round(2)}"
	end

end
