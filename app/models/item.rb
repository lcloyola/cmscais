class Item < ActiveRecord::Base
  attr_accessible :name, :remarks
  has_many :units
  has_many :properties
  scope :is_public, :conditions => ['is_public = ?', true]
end

