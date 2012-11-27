class Unit < ActiveRecord::Base
  attr_accessible :is_public, :name, :remarks, :child_ids, :parent_ids, :item_id, :location_id, :user_id

  belongs_to :item
  belongs_to :user
  belongs_to :location
  has_many :logs

  has_many :subunits

  validates_presence_of :item, :user, :location
end

