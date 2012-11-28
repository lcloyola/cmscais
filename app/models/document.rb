class Document < ActiveRecord::Base
  attr_accessible :file, :name, :remarks, :unit_id

  has_attached_file :file
  belongs_to :unit

  validates_presence_of :unit
end

