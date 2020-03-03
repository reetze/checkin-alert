# == Schema Information
#
# Table name: flights
#
#  id           :integer          not null, primary key
#  departs_at   :datetime
#  description  :string
#  message_sent :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  passenger_id :integer
#

class Flight < ApplicationRecord

  validates :passenger_id, :presence => true
  validates :departs_at, :presence => true

end
