# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'geokit'

class DLCity
	attr_reader :geoloc, :name

  def initialize(name, lat, lng)
		@name = name
		@geoloc = Geokit::GeoLoc.new(:lat => lat, :lng => lng)
  end
end
