class Room < ActiveRecord::Base
 mount_uploader :images, CoverUploader
has_many :bookings
belongs_to :user
belongs_to :city
has_many :amenity_rooms
has_many :amenities, through: :amenity_rooms

  validates_presence_of :name, :description, :price, :address, :rules,:city_id, :user_id
   validates_length_of :description, within: (1..150)

   after_save :change_role
   before_save :search_lat_long
   after_create :authorize
    def search_lat_long
  
  	response = HTTParty.get("http://maps.googleapis.com/maps/api/geocode/json?address=#{self.address}")
  	@result = JSON.parse(response.body)
  	self.latitude = @result["results"][0]["geometry"]["location"]["lat"]
  	self.longitude = @result["results"][0]["geometry"]["location"]["lng"]
  	
   end

  def change_role
  	if self.user.role.name == "guest"
       self.user.update_attributes(role_id:Role.second.id)
  end
  end 

  def authorize
   if self.is_authoried == true
   Notification.room_conformation(self).deliver! 

  end
  end
end
