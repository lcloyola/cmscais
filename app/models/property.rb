class Property < ActiveRecord::Base
  belongs_to :item
  has_many :logs

  attr_accessible :datatype, :name, :remarks, :item_id
  validates_presence_of :item
end

