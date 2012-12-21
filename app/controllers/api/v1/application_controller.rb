class API::V1::ApplicationController < API::ApplicationController
  before_filter :check_localization
  before_filter :check_privacy

  def check_localization
    authenticate_user! if PREFERENCES['localization'] == true
  end

  def check_privacy
    authenticate_user! if PREFERENCES['privacy'] == true
  end
end

