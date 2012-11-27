class Checkin < ActiveRecord::Base
  attr_accessible :remarks, :user_id, :location_id
  belongs_to :user
  belongs_to :location

  validates_presence_of :user, :location
end

