class Unit < ActiveRecord::Base
  require 'ipaddr'
  require 'httparty'
  require 'net/http'
  attr_accessible :is_public, :name, :remarks, :child_ids, :parent_ids, :item_id, :location_id, :user_id

  belongs_to :item
  belongs_to :user
  belongs_to :location
  has_many :logs
  has_many :documents

  has_many :subunits, :foreign_key => :child_id, :dependent => :destroy
  has_many :parents, :through => :subunits, :source => :parent, :dependent => :destroy
  has_many :children, :through => :reverse_subunits, :source => :child, :dependent => :destroy
  has_many :reverse_subunits, :foreign_key => :parent_id, :class_name => "Subunit", :dependent => :destroy

  has_many :accessibles
  has_many :accessors, :through => :accessibles, :source => :user

  validates_presence_of :item, :user, :location

  after_save :post_to_clients

  scope :is_public, :conditions => ['is_public = ?', true]
  scope :is_private, :conditions => ['is_public = ?', false]
  scope :location_accessible, lambda { |location|
    where('location_id = ?', location.id)
  }

  def as_json(options={})
    super(:except => [:item_id, :location_id]).merge({:item => item.name,
                                                            :location => self.location.name,
                                                            :logs => self.logs.group_by(&:property_id),
                                                            :documents => self.documents
                                                            })
  end
  def self.network_accessible(ipaddress)
    net1 = IPAddr.new(ipaddress)
    units = []
    Location.all.each do |l|
      range = IPAddr.new(l.iprange)
      units << l.units if range.include?(net1)
    end
    return units
  end
private
  def post_to_clients
    if PREFERENCES['filter_type'] == 'change'
      self.created_at_changed? ? type = "new record" : type = "update record"
      body = {:update_type => type, :entity => "unit",
              :unit =>  self.as_json}
      SendUpdate.perform(body)
    end
  end
end

