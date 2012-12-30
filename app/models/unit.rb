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

  scope :is_public, :conditions => ['is_public = ?', true]
  scope :is_private, :conditions => ['is_public = ?', false]
  scope :location_accessible, lambda { |location|
    where('location_id = ?', location.id)
  }

  after_save :post_to_server

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
  def post_to_server
    #HTTParty.post("http://localhost:3000/units.json", :body => {:unit => { :item_id => '1', :user_id => "1", :location_id => "1", :name => "booya"}})
    #HTTParty.post("http://localhost:3000/api/v1/tokens.json", :body => { :email => "admin@admin.com", :password => "pass.1"})
    #HTTParty.post("http://localhost:3000/items.json", :body => {:item => { :name => "ahihi"}}, :header => {:auth_token => "sAFQTVysozBGGQxNPBwz" })
    HTTParty.post("http://localhost:8080/items.json", :body => {:item => { :name => "aaa9"}}, :header => {:auth_token => "sAFQTVysozBGGQxNPBwz" })
  end
end

