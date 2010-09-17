class HomeController < ApplicationController
  def index
  end

	def find_nearest_city
		ip = params[:ip]

		@nearest_city = "TODO"
		render :action => "index"
	end
end
