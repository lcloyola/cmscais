class Sublocation < ActiveRecord::Base
  attr_accessible :remarks, :parent_id, :child_id

  belongs_to :parent, :class_name => "Location"
  belongs_to :child, :class_name => "Location"

  validates_presence_of :parent_id, :child_id
end

