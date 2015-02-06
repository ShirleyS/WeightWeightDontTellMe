class GuessController < ApplicationController

	def index
    if ((params[:height].present?) && (params[:height].to_i != 0) && (params[:weight].to_i != 0))
    	@query_height = params[:height].to_i
			@query_weight = params[:weight].to_i
    	@gender_guess = Guess.check_accuracy(@query_height, @query_weight)
    elsif (params[:height].nil? && params[:weight].nil?)
    	p "first time through?"
    else
    	@error_message = "please fill in both of the form fields correctly with integers"
    end

    render :index
	end

	def create
		if params[:guess][:accuracy] == "incorrect"
			@accuracy = Guess.new(:height => params[:guess][:height], :weight => params[:guess][:weight], :gender => params[:guess][:gender],:accuracy => false )
		else
			@accuracy = Guess.new(:height => params[:guess][:height], :weight => params[:guess][:weight], :gender => params[:guess][:gender],:accuracy => true )
		end

		@accuracy.save
		render 'thanks/index'
	
	end

end
