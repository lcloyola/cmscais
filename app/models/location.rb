class Location < ActiveRecord::Base
  require 'ipaddr'

  attr_accessible :iprange, :latmax, :latmin, :longmax, :longmin, :name, :child_ids, :parent_ids
  has_many :checkins
  has_many :units

  has_many :sublocations, :foreign_key => :child_id, :dependent => :destroy
  has_many :parents, :through => :sublocations, :source => :parent, :dependent => :destroy
  has_many :children, :through => :reverse_sublocations, :source => :child, :dependent => :destroy
  has_many :reverse_sublocations, :foreign_key => :parent_id, :class_name => "Sublocation", :dependent => :destroy

  validates_presence_of :name

  def self.find_by_coordinates(lat, lng)
    return Location.where("latmax >= ? AND latmin <= ? AND longmax >= ? AND longmin <= ?", lat, lat, lng, lng)
  end

  def self.find_by_ipaddress(ip)
    user_ip = IPAddr.new(ip)
    locations = []

    Location.all.each do |l|
      locations << l if l.iprange.present? && l.ip_range === user_ip
    end
    return locations
  end

  def self.search_by_name(query)
    return Location.find(:all, :conditions => ["name LIKE ?", '%' + query + '%'])
  end

  def ip_range
    return IPAddr.new(self.iprange.to_s)
  end

end

