class Booking < ActiveRecord::Base
belongs_to :room
belongs_to :user

validates_presence_of :start_date, :end_date, :user_id, :room_id

validate :check_date
after_update :confirmed

#private
def check_date
 if self.start_date < Date.today
 self.errors.add(:base, "start date cannot be less than today")
elsif (self.start_date > self.end_date)
 	self.errors.add(:base, "end date cannot be less than start date")

 end
 end 

end
