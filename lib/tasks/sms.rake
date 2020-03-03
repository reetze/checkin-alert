task({ :send_sms => :environment }) do
  p "There are " + Flight.count.to_s + " flights."
  
  p "Messages will be sent for " + Flight.where("departs_at > ?", Time.now).where({ :message_sent => false }).count.to_s + " upcoming flights."

end