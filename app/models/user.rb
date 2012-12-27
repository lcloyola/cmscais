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

  def last_checkin
    return self.checkins.last
  end

  def permitted_units
    if PREFERENCES['privacy'] == 'custom'
        units = self.accessible_units.is_private
      else
        units = Unit.is_private
      end

    if PREFERENCES['localization'] == true
      units = units.location_accessible(self.last_checkin.location)
    end

    return units
  end
end

