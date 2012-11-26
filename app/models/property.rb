class Property < ActiveRecord::Base
  belongs_to :item
  attr_accessible :datatype, :name, :remarks
end
