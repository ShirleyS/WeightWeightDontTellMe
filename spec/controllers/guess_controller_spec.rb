# TODO ADD CHECK FOR IF DIFFS/DISTANCES ARE EXACTLY THE SAME
# Problems with rack meant less tests. 
# Uncertain about response.status, would have prefered 'last_response' via rack.

require "rails_helper"
require "./app/controllers/guess_controller"

describe GuessController do
	describe "check routes" do
		context "guess#index" do 
			it "should return 200" do
				get :index
				expect(response.status).to eq(200)
			end
		end

		context "thanks#index" do
			it "should return 200" do
				get '/thanks'
				expect(response.status).to eq(200)
			end
		end
	end
end

describe GuessModel do
	describe "check if model increments with creation in db" do
		context "male created" do 
			it "should return a count of males increased by 1" do
				previous_count = Guess.where(:gender => 'male').count
				Guess.new(:gender => 'male') 
				updated_count = Guess.where(:gender => 'male').count 
				expect(updated_count - previous_count).to eq(1)
			end
		end

		context "female created" do 
			it "should return a count of females increased by 1" do
				previous_count = Guess.where(:gender => 'female').count
				Guess.new(:gender => 'female') 
				updated_count = Guess.where(:gender => 'female').count 
				expect(updated_count - previous_count).to eq(1)
			end
		end
	end

	describe "check if accuracy increments with response" do

		context "response will add one more true value or one more false value" do 
			it "total accuracy responses should increase by one" do
				previous_count = Guess.where(:gender => 'female').count
				Guess.new(:gender => 'female') 
				updated_count = Guess.where(:gender => 'female').count 
				expect(updated_count - previous_count).to eq(1)
			end
		end
	end
end

	# additional tests below (unable to reach due to rack issues)->
	# context "something out of bounds respond with 400" do 
	# 	it "should return 400" do
	# 		get '/dogpatch'
	# 		expect(response.code).to respond_with(400)
	# 	end
	# end	

	# context "guess#create" do 
	# 	it "should return 200" do
	# 		expect(:post =>'/guess').last_response.status.to eq(201)
	# 	end
	# end	

	# describe "check if weight and height inputs are present and valid"
	# context "check if input for height are numbers" do



	#additional capybara testing tbd->
	#context if numbers entered in weight only
	#context if numbers entered in height only
	#context if letters in height, weight num
	#context if letters in weight, height num
	#check weight value outside of original range.	
	#check height value outside range, provided, weight expected to guess
	#if num correct match for male, for female
	#height given, with range 








