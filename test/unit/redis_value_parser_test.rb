# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'redis_value_parser'

class RedisValueParserTest < Test::Unit::TestCase
  def test_should_resolve_value_into_geolocation
    value = "US;United States;04;Arizona;Tempe;85281;33.4357;-111.917;753"
		parser = RedisValueParser.new(value)

		geolocation = parser.resolve_geolocation
		assert_equal 33.4357, geolocation.lat
		assert_equal -111.917, geolocation.lng
  end
end
