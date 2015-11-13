class Reading < ActiveRecord::Base
  belongs_to :user

  def self.previous_reading(user)
    user.readings.order(:reading_date).last.reading
  end

  def self.cost_calculation(user, current_reading)
    cost = (current_reading.to_i - previous_reading(user).to_i) * 0.28
  end
end
