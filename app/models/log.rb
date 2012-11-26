class Log < ActiveRecord::Base
  belongs_to :unit
  belongs_to :properties
  attr_accessible :value
end
