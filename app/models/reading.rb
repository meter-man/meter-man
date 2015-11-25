class Reading < ActiveRecord::Base
  belongs_to :user
  validate :reading_within_allowable_range

  def reading_within_allowable_range
    readings = Reading.where(user_id: self.user_id)
    if readings.count == 0 && self.reading > 0
      return true
    end
    record_before = Reading
      .where("reading_date < '#{self.reading_date}'")
      .order(:reading_date)
      .last
    record_after = Reading
      .where("reading_date > '#{self.reading_date}'")
      .order(:reading_date)
      .first
    too_low = !record_before.nil? && (self.reading < record_before.reading)
    too_high = !record_after.nil? && (self.reading > record_after.reading)
    negative = self.reading < 0
    if too_low || too_high || negative
      errors.add(:reading, 'is not within allowable range')
    end
  end
end
