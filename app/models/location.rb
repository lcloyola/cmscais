class Location < ActiveRecord::Base
  attr_accessible :iprange, :latmax, :latmin, :longmax, :longmin, :name, :child_ids, :parent_ids
  has_many :checkins
  has_many :units
  has_many :sublocations

  validates_presence_of :name
end

