class Amenity < ActiveRecord::Base

has_many :amentiy_rooms
has_many :rooms, through: :amentiy_rooms
end
