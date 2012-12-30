class Log < ActiveRecord::Base
  belongs_to :unit
  belongs_to :property
  attr_accessible :value, :unit_id, :property_id
  validates_presence_of :unit_id, :property_id

  before_save :post_to_clients

  #todo: group by properties
  def as_json(options={})''
    super(:except => [:property_id, :unit_id]).merge({:property => self.property.name})
  end

private
  def post_to_clients
    if PREFERENCES['filter_type'] == 'change'
      self.created_at_changed? ? type = "new record" : type = "update record"
      body = {:update_type => type, :entity => "log",
              :log =>  self.as_json}
      SendUpdate.perform(body)
    end
  end
end

