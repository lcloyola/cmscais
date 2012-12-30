class Document < ActiveRecord::Base
  attr_accessible :file, :name, :remarks, :unit_id

  has_attached_file :file
  belongs_to :unit

  validates_presence_of :unit

  after_save :post_to_clients

private
  def post_to_clients
    if PREFERENCES['filter_type'] == 'change'
      self.created_at_changed? ? type = "new record" : type = "update record"
      body = {:update_type => type, :entity => "document",
              :document =>  self.as_json}
      SendUpdate.perform(body)
    end
  end
end

