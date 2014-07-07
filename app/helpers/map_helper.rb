module MapHelper
	def format_distance(distance)
		distance > 1 ? "#{distance.round(2)} km"  : "#{(distance * 1000).round(2)} m"
	end

end
