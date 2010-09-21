require 'rubygems'
require 'redis'
require 'd_l_city'

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
			@map = get_map(@nearest_city)
		else
			@nearest_city = nil
		end

		render :action => "index"
	end

	:private

	# TODO Refactor
	def calculate_nearest_city(geolocation)
		distance_to_austin = geolocation.distance_to @austin.geoloc
		distance_to_new_york = geolocation.distance_to @new_york.geoloc

		return distance_to_austin > distance_to_new_york ?
			@new_york : @austin
	end
	
	# TODO Refactor
	def initialize_cities_with_service
		@new_york = DLCity.new("New York", 40.733, -74.0078)
		@austin = DLCity.new("Austin", 30.2414, -97.7687)
	end

	def get_map(dlCity)
		map = GMap.new("map_div")
		map.control_init(:large_map => true, :map_type => true)

		coordinates = [dlCity.geoloc.lat, dlCity.geoloc.lng]
		map.center_zoom_init(coordinates, 6)
		map.overlay_init(GMarker.new(coordinates, :title => dlCity.name,
				:info_window => dlCity.name))
		return map
	end
end
