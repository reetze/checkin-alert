task({ :send_sms => :environment }) do

  # future flights that depart in the next 24 hours and 15 minutes where the message has not been sent
  flights_to_send_msg = Flight.where("departs_at > ?", Time.now).where("departs_at < ?", Time.now + 24.hours + 15.minutes).where({ :message_sent => false })

  flights_to_send_msg.each do |flight|
    p flight.description
    p flight.passenger.phone_number

    flight.message_sent = true
    flight.save
  end

end