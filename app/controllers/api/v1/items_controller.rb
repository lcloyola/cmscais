class Api::V1::ItemsController < API::V1::ApplicationController
  #before_filter :parse_body_json, only: :create

  # show all public / accessible items
  # TODO: also show private units if logged in
  def index
    respond_with(Item.is_public, :only => [:id, :name,:remarks])
  end

  # return item if accessible (public or user logged in)
  # TODO: specify limit of units
  def show
    item = Item.find(params[:id])
    if current_user.present?
      if PREFERENCES['privacy'] == 'custom'
        private_units = current_user.accessible_units.is_private.where(:item_id => item.id)
      else
        private_units = current_user.is_private.where(:item_id => item.id)
      end
    end

    if item.is_public? || current_user.present?
      render :json => {:item => item, :public_units => item.units.is_public,
                        :private_units => private_units}
    else respond_with nil
    end
  end
end

