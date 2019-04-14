class Location < ApplicationRecord
  validates_presence_of :citystate
  validates_presence_of :latitude
  validates_presence_of :longitude
end
