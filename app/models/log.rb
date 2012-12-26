class Log < ActiveRecord::Base
  belongs_to :unit
  belongs_to :property
  attr_accessible :value, :unit_id, :property_id
  validates_presence_of :unit_id, :property_id

  #todo: group by properties
  def as_json(options={})''
    super(:except => [:property_id, :unit_id]).merge({:property => self.property.name})
  end

end

