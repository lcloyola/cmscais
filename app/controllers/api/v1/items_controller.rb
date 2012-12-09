class Api::V1::ItemsController < API::V1::ApplicationController
  #before_filter :parse_body_json, only: :create

  # show all public / accessible items
  def index
    respond_with(Item.is_public, :only => [:id, :name,:remarks])
  end


  # return item if accessible (public or user logged in)
  def show
    item = Item.find(params[:id])
    if item.is_public? || current_user.present?
      render :json => {:item => item, :units => item.units.is_public.limit(3)}
      # to do: consider per user restrictions // #is_accessible
    end
  end
end

