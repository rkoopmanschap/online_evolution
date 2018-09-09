class PhysicalAllele
	def initialize(gene)
		@gene = gene

		@gather_1 	= rand(100).to_f / 100
		@gather_2	= rand(100).to_f / 100
		@gather_3	= rand(100).to_f / 100
		@attack		= rand(100).to_f / 100
		@armor		= rand(100).to_f / 100
		@camouflage	= rand(100).to_f / 100
		@speed		= rand(100).to_f / 100

		# formula can be different
		@nutrition 	= (@gather_1 + @gather_2 + @gather_3 + @attack + @armor + @camouflage + @speed) * ((rand(40).to_f / 40) - 0.2)
		@cost		= (@gather_1 + @gather_2 + @gather_3 + @attack + @armor + @camouflage + @speed) * ((rand(40).to_f / 40) - 0.2)
	end

end
