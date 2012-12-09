class Accessible < ActiveRecord::Base
  belongs_to :unit
  belongs_to :user
  attr_accessible :user_id, :unit_id
  validates_presence_of :unit_id, :user_id
end

