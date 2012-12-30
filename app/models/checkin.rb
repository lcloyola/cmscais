class Checkin < ActiveRecord::Base
  attr_accessible :remarks, :user_id, :location_id
  belongs_to :user
  belongs_to :location

  validates_presence_of :user, :location

  after_save :post_to_clients

  def self.with_changes(last_update)
    Checkin.find(:all, :conditions => ["updated_at >= ?", last_update])
  end

private
  def post_to_clients
    if PREFERENCES['change_base']
      self.created_at_changed? ? type = "new record" : type = "update record"
      body = {:update_type => type, :entity => "checkin",
              :checkin =>  self.as_json}
      SendUpdate.perform(body)
    end
  end
end

