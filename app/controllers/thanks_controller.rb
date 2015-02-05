class ThanksController < ApplicationController
  after do
	  ActiveRecord::Base.clear_active_connections!
	end
end
