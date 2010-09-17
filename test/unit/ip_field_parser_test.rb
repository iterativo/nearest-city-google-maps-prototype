# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'ip_field_parser'

class IpFieldParserTest < Test::Unit::TestCase
  def test_should_remove_periods_from_ip_field
    ip_field = '127.0.0.1'
		assert_equal '127001', IpFieldParser.parse(ip_field)
  end
end
