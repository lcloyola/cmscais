class Sublocation < ActiveRecord::Base
  belongs_to :parent_id
  belongs_to :child_id
  attr_accessible :remarks
end
