# coding: utf-8
module MapHelper
	#Считаем расстояние между двумя координатами
  def distance (a, b)
    rad_per_deg = Math::PI/180  
    rkm = 6371                  # Радиус Земли в км            
    rm = rkm * 1000             # Радиус в метрах

    dlon_rad = (b[:longitude]-a[:longitude]) * rad_per_deg 
    dlat_rad = (b[:latitude]-a[:latitude]) * rad_per_deg

    lat1_rad, lon1_rad = a[:latitude] * rad_per_deg, a[:longitude] * rad_per_deg
    lat2_rad, lon2_rad = b[:latitude] * rad_per_deg, a[:longitude] * rad_per_deg

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math.asin(Math.sqrt(a))

    rm * c / 1000 # Расстояние в км

  end

	def format_distance(distance)
		distance > 1 ? "#{distance.round(2)} #{t(:km)}"  : "#{(distance * 1000).round(2)} #{t(:m)}"
	end

end
