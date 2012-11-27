class Item < ActiveRecord::Base
  attr_accessible :name, :remarks
  has_many :units
  has_many :properties
end

