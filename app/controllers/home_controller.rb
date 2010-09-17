require 'rubygems'
require 'redis'
require 'geokit'

class HomeController < ApplicationController
  def index
  end

	# Valid IP values (for UI):
	# Tempe, Arizona: 71788544
	# Buffalo, New York: 71029760
	def find_nearest_city
		initialize_cities_with_service()

		ip_field = params[:ip]
		parsed_ip = IpFieldParser.parse(ip_field)

		redis = Redis.new
		redis_value = redis.get parsed_ip

		if (redis_value)
			ip_geolocation = RedisValueParser.new(redis_value).resolve_geolocation
			@nearest_city = calculate_nearest_city(ip_geolocation)
		else
			@nearest_city = "Unknown IP"
		end

		render :action => "index"
	end

	:private

	# TODO Refactor
	def calculate_nearest_city(geolocation)
		distance_to_austin = geolocation.distance_to @austin
		distance_to_new_york = geolocation.distance_to @new_york

		return distance_to_austin > distance_to_new_york ?
			"New York" : "Austin"
	end
	
	# TODO Refactor
	def initialize_cities_with_service
		@new_york = Geokit::GeoLoc.new
		@new_york.lat = 40.733
		@new_york.lng = -74.0078

		@austin = Geokit::GeoLoc.new
		@austin.lat = 30.2414
		@austin.lng = -97.7687
	end
end
