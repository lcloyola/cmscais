class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :checkins

  has_many :accessibles
  has_many :accessible_units, :through => :accessibles, :source => :unit

  before_save :post_to_clients

  def last_checkin
    return self.checkins.last
  end

  def permitted_units
    if PREFERENCES['localization'] == true
      if PREFERENCES['localization_type'] == 'network'
        units = Unit.is_private.network_accessible(self.current_sign_in_ip)
      else
        units = Unit.is_private.location_accessible(self.last_checkin.location)
      end
    end
    if PREFERENCES['privacy'] == 'custom'
      units = self.accessible_units.is_private
    end
    return units
  end
  def self.with_changes(last_update)
    User.find(:all, :conditions => ["updated_at >= ?", last_update])
  end
private
  def post_to_clients
    if PREFERENCES['filter_type'] == 'change'
      self.created_at_changed? ? type = "new record" : type = "update record"
      body = {:update_type => type, :entity => "user",
              :user =>  self.as_json}
      SendUpdate.perform(body)
    end
  end
end

