class Item < ActiveRecord::Base
  attr_accessible :name, :remarks, :is_public
  has_many :units
  has_many :properties
  scope :is_public, :conditions => ['is_public = ?', true]

  after_save :post_to_clients

  def self.with_changes(last_update)
    Item.find(:all, :conditions => ["updated_at >= ?", last_update])
  end

  def as_json(options={})
    super().merge({:properties => self.properties})
  end
private
  def post_to_clients
    if PREFERENCES['change_base']
      self.created_at_changed? ? type = "new record" : type = "update record"
      body = {:update_type => type, :entity => "item",
              :item =>  self.as_json}
      SendUpdate.perform(body)
    end
  end
end

