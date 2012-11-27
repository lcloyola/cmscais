class Log < ActiveRecord::Base
  belongs_to :unit
  belongs_to :property
  attr_accessible :value, :unit_id, :property_id
  validates_presence_of :unit_id, :property_id
end

