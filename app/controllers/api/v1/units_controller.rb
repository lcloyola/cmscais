class Api::V1::UnitsController < API::V1::ApplicationController
  #before_filter :parse_body_json, only: :create
  #before_filter :check_unit_location, only: :show

  # show all public / accessible units
  # TODO: also show private units if logged in
  def index
    public_units = Unit.is_public

    if current_user.present?
      # fix this!!!
        private_units = current_user.permitted_units
      if PREFERENCES['localization'] == true
        public_units = public_units.location_accessible(current_user.last_checkin.location)
      end
    end

    @result = {:public_units => public_units,
                      :private_units => private_units}

    respond_to do |format|
      format.json { render json: @result }
      format.xml { render xml: @result.to_xml }
    end
  end

  def show
    unit = Unit.find(params[:id])
    if unit.is_public? || current_user.permitted_units.include?(unit)
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

