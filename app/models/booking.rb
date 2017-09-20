class Booking < ActiveRecord::Base
belongs_to :room
belongs_to :user

validates_presence_of :start_date, :end_date, :user_id, :room_id

validate :check_date
after_create :confirmed
private
def check_date
 if (self.start_date < Date.today)||(self.start_date < self.end_date)||(self.start_date == self.end_date)
 self.errors.add(:start_date, "cannot be lessthan today")

 end
 end 

def confirmed
self.user_id = current_user.id
Notification.conformation(self).deliver!
end

end
