class Property < ActiveRecord::Base
  belongs_to :item
  has_many :logs

  attr_accessible :datatype, :name, :remarks, :item_id
  validates_presence_of :item

  before_save :post_to_clients

  def as_json(options={})
    super(:except => [:item_id, :updated_at, :created_at]).merge({:item => self.item.name, :logs => self.logs})
  end

private
  def post_to_clients
    if PREFERENCES['filter_type'] == 'change'
      self.created_at_changed? ? type = "new record" : type = "update record"
      body = {:update_type => type, :entity => "property",
              :property =>  self.as_json}
      SendUpdate.perform(body)
    end
  end
end

