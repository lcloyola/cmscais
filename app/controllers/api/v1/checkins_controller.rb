class Api::V1::CheckinsController < API::V1::ApplicationController
  before_filter :authenticate_user!
  #before_filter :parse_body_json, only: :create

  # return current user last checkin
  def index
    checkin = lastcheckin = current_user.checkins.last
    respond_with(checkin, :include => {:location => {:only => [:name, :longmin, :longmax, :latmin, :latmax]}},
                          :only => [:created_at, :remarks])
  end

  # create checkin for current_user and return current_user last checkin
  def create
    location = Location.find(params[:location])

    if current_user.present? && location.present?
      checkin = Checkin.create(:user_id => current_user.id, :location_id => location.id, :remarks => params[:remarks])
    end
    render :json => {:checkin => checkin, :location => checkin.location}
  end

  # return current user x number of last checkins
  def show
    checkin = current_user.checkins.order("id DESC").limit(params[:id])

    respond_with(checkin, :include => {:location => {:only => [:name, :longmin, :longmax, :latmin, :latmax]}},
                          :only => [:created_at, :remarks])
  end
end

