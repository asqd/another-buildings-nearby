# coding: utf-8
module MapHelper
	

	def format_distance(distance)       
		distance > 1 ? "#{distance.round(2)} #{t(:km)}"  : "#{(distance * 1000).round(2)} #{t(:m)}"
	end

end
