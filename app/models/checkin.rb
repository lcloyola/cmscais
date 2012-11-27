class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  attr_accessible :remarks, :user_id, :location_id
  validates_presence_of :user, :location
end

