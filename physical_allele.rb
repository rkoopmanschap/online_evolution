class PhysicalAllele

	attr_reader :gather_plants, :gather_insects, :gather_fish, :attack, :armor, :camouflage, :speed, :dominance, :cost, :nutrition

	def initialize(gene, dominance)
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
		@nutrition 	= [(@gather_plants + @gather_insects + @gather_fish + @attack + @armor + @camouflage + @speed) + ((rand(40).to_f / 100) - 0.2), 0].max
		@cost		= [(@gather_plants + @gather_insects + @gather_fish + @attack + @armor + @camouflage + @speed) + ((rand(40).to_f / 100) - 0.2), 0].max
	end

	def to_s
		puts "gather_plants     = #{gather_plants}"
		puts "gather_insects    = #{gather_insects}"
		puts "gather_fish       = #{gather_fish}"
		puts "attack            = #{attack}"
		puts "armor             = #{armor}"
		puts "camouflage        = #{camouflage}"
		puts "speed             = #{speed}"
		puts "dominance         = #{dominance}"
		puts "nutrition         = #{nutrition}"
		puts "cost              = #{cost}"
	end

end
