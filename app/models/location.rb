class Location < ActiveRecord::Base
  attr_accessible :iprange, :latmax, :latmin, :longmax, :longmin, :name, :child_ids, :parent_ids
  has_many :checkins
  has_many :units

  has_many :sublocations, :foreign_key => :child_id, :dependent => :destroy
  has_many :parents, :through => :sublocations, :source => :parent, :dependent => :destroy
  has_many :children, :through => :reverse_sublocations, :source => :child, :dependent => :destroy
  has_many :reverse_sublocations, :foreign_key => :parent_id, :class_name => "Sublocation", :dependent => :destroy

  validates_presence_of :name
end

