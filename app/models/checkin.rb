class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  attr_accessible :remarks
end
