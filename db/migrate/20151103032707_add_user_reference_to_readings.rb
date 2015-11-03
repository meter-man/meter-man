class AddUserReferenceToReadings < ActiveRecord::Migration
  def change
    add_reference :readings, :user, index: true, foreign_key: true
  end
end
