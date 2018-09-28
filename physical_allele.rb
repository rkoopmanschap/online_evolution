class PhysicalAllele
	def initialize(gene)
		@gene = gene

		@gather_plants 	= rand(100).to_f / 100
		@gather_insects	= rand(100).to_f / 100
		@gather_fish	= rand(100).to_f / 100
		@attack		= rand(100).to_f / 100
		@armor		= rand(100).to_f / 100
		@camouflage	= rand(100).to_f / 100
		@speed		= rand(100).to_f / 100
		@dominance 	= dominance

		# formula can be different
		@nutrition 	= (@gather_plants + @gather_insects + @gather_fish + @attack + @armor + @camouflage + @speed) * ((rand(40).to_f / 40) - 0.2)
		@cost		= (@gather_plants + @gather_insects + @gather_fish + @attack + @armor + @camouflage + @speed) * ((rand(40).to_f / 40) - 0.2)
	end

end
