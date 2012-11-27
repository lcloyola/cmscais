class Subunit < ActiveRecord::Base
  attr_accessible :relationship, :remarks, :parent_id, :child_id

  belongs_to :child, :class_name => "Unit"
  belongs_to :parent, :class_name => "Unit"

  validates_presence_of :parent_id, :child_id
end

