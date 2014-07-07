class MapController < ApplicationController
  skip_before_action :verify_authenticity_token

  respond_to :html, :js
  def index
    #@buildings = Building.all
  end

  def show
    point = Building.new(latitude: params[:latitude], longitude: params[:longitude])

    @buildings = Building.close_to(point[:latitude], point[:longitude])
    
    #distances = compute_distances(@buildings, point)

    #@buildings = distances.sort_by { |k, v| k }

    respond_to do |format|
      format.html { redirect_to root_url }
      format.js {}
    end
  end

end
