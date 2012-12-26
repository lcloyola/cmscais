class Unit < ActiveRecord::Base
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

  def as_json(options={})
    super(:except => [:item_id, :location_id]).merge({:item => item.name,
                                                            :location => self.location.name,
                                                            :logs => self.logs.group_by(&:property_id),
                                                            :documents => self.documents
                                                            })
  end
end

