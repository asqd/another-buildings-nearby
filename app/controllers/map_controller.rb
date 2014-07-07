class MapController < ApplicationController
  skip_before_action :verify_authenticity_token

  respond_to :html, :js
  def index
    #@buildings = Building.all
  end

  def show
    point = Building.new(latitude: params[:latitude], longitude: params[:longitude])

    @buildings = Building.close_to(point[:latitude], point[:longitude])
    
    distances = compute_distances(@buildings, point)

    @buildings = distances.sort_by { |k, v| k }

    respond_to do |format|
      format.html { redirect_to root_url }
      format.js {}
    end
  end

  private

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

  def compute_distances(buildings, point)
    distances = {}

    buildings.each do |building|
      d = distance(building, point)
      distances[d] = building
    end
    distances
  end

end
