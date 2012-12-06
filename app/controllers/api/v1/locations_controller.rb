class Api::V1::LocationsController < API::V1::ApplicationController

  before_filter :parse_body_json, only: :create

  def index
    @locations = Location.all
    if params[:lat].present? && params[:lng].present?
      @locations = Location.find_by_coordinates(params[:lat], params[:lng])
    elsif params[:ip].present?
      @locations = Location.find_by_ipaddress(params[:ip])
    end

    respond_with @locations
  end

  def show
    @location = Location.find(params[:id])

    respond_with @location
  end

  def create
    @location = Location.new_through_api(@attributes['location'])
    @location.save

    respond_with @location
  end

end

