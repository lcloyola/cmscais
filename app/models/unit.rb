class Unit < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  belongs_to :location
  attr_accessible :is_public, :name, :remarks
end
