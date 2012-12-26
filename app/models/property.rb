class Property < ActiveRecord::Base
  belongs_to :item
  has_many :logs

  attr_accessible :datatype, :name, :remarks, :item_id
  validates_presence_of :item

  def as_json(options={})
    super(:except => [:item_id, :updated_at, :created_at]).merge({:item => self.item.name, :logs => self.logs})
  end
end

