class Api::V1::UnitsController < API::V1::ApplicationController
  #before_filter :parse_body_json, only: :create

  # show all public / accessible units
  # TODO: also show private units if logged in
  def index
    public_units = Unit.is_public

    if current_user.present?
      if PREFERENCES['privacy'] == 'custom'
        private_units = current_user.accessible_units.is_private
      else
        private_units = Unit.is_private
      end
    end

    render :json => {:public_units => public_units,
                      :private_units => private_units}
  end

  def show
    unit = Unit.find(params[:id])
    if unit.is_public? || current_user.accessible_units.include?(unit)
      respond_with(unit, :except => [:item_id, :location_id],
                         :methods => [:documents],
                         :include => {:item => {:only => [:name], :methods => [:properties]},
                             :location => {:only => [:name]},
                             :logs => {},
                             })
    else render :json => {:status => "Unauthorized"}, :status => :unauthorized
    end
  end
end

