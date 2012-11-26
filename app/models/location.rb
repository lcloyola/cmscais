class Location < ActiveRecord::Base
  attr_accessible :iprange, :latmax, :latmin, :longmax, :longmin, :name
end
