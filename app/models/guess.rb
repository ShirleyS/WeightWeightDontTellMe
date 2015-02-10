class Guess < ActiveRecord::Base
	#TODO 1: Add Feet and Metric System Options 
	#TODO 2: Add checking/timer feature to not re-create an entry in 
	#the db if the computer used went through the site within the past minute.
	#TODO 3: Adaptive feature for people outside of the base ranges.

	# attr_reader :true_count, :false_count
	validates :weight, :height, presence: true

	#height in inches, weight in lbs
	@female_averages = {60=>100,61=>105,62=>110,63=>115,64=>120,65=>125,66=>130,67=>135,68=>140,
		69=>145,70=>150,71=>155,72=>160,73=>165,74=>170,75=>175,76=>180,
		77=>185,78=>190,79=>200,80=>205}

	@male_averages = {60=>106,61=>112,62=>118,63=>124,64=>130,65=>136,66=>142,67=>148,68=>154,
		69=>160,70=>166,71=>172,72=>178,73=>184,74=>190,75=>196,76=>202,
		77=>208,78=>214,79=>220,80=>226}

	def self.check_weight_by_height(height, weight)
		@gender_guess = ["male","female"].sample
		if height >= 108
			@message = "Mix up the height and weight fields? You must be: "
		else	
			#just checking in female to see if that height is there
			if @female_averages.has_key?(height)
				#take the height check distance from value
				@dist_hash = {"female" => (@female_averages[height] - weight).abs, 
							  "male" => (@male_averages[height] - weight).abs}
				@message = '' 
				@gender_guess = @dist_hash.key(@dist_hash.values.min)
			else
				#out of current base range.
				#with more time, I would include an adaptive feature that would incorporate the random guess with the accuracy, and build the additional ranges from there.
				@message = "Random guess: "
			end
		end

	end

	def self.check_accuracy(height_in, weight_in)
	 	self.check_weight_by_height(height_in, weight_in)
		p @true_count = Guess.where(:height => height_in, :accuracy => true).count
		p @false_count = Guess.where(:height => height_in, :accuracy => false).count
		
		if (@true_count >= @false_count)
			return @message + @gender_guess
		elsif ((@true_count < @false_count) && ((@true_count + @false_count) > 10)) 
			@gender_guess == "female" ? "male" : "female"
			return @message + @gender_guess
		else 
			return "male?" #see line 30. lower priority feature given ranges.
		end
	end

end
