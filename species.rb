class Species

	def initialize
		@animals = []

		# assign initial allele likelihood

		NUMBER_OF_ANIMALS.times do
			@animals << Animal.new()
		end
	end

	def process_generation
		# for all species
	end

end
