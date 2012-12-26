class Item < ActiveRecord::Base
  attr_accessible :name, :remarks, :is_public
  has_many :units
  has_many :properties
  scope :is_public, :conditions => ['is_public = ?', true]

  def as_json(options={})
    super().merge({:properties => self.properties})
  end
end

