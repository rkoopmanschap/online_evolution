class Population

	def initialize
		@species_list = []
		NUMBER_OF_SPECIES.times do
			@species_list << Species.new
		end
	end

	def process_generation
		# for all species
	end

end
