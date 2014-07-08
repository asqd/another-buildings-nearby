class MapController < ApplicationController
  skip_before_action :verify_authenticity_token

  respond_to :html, :js
  def index
  end

  def show
    point = Building.new(latitude: params[:latitude], longitude: params[:longitude])

    @buildings = Building.close_to(point[:latitude], point[:longitude])
    
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js {}
    end
  end

end
