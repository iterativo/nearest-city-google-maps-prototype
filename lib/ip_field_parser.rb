# To change this template, choose Tools | Templates
# and open the template in the editor.

class IpFieldParser
  def initialize
    
  end

	def IpFieldParser.parse ip_field
		return ip_field.gsub('.', '')
	end
end
