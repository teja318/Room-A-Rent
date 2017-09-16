class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.room_conformation.subject
  #
  def room_conformation(rooms)
    #@greeting = "Hi"
      @room = rooms
    mail to: "#{@room.user.email}", subject: "room confirmed"
  end

  def confirmed(bookings)
    @booking = bookings
    mail to: "#{@booking.user.email}", subject: "booking confirmed"
  end  
  
  def not 


end
