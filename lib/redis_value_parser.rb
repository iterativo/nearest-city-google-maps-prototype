# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'rubygems'
require 'geokit'

class RedisValueParser
  def initialize(value)
    @value = value
  end

	def resolve_geolocation
		values = @value.split(';')
		return Geokit::GeoLoc.new :lat => values[6], :lng => values[7]
	end
end
