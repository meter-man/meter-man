class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :reading
      t.date :reading_date

      t.timestamps null: false
    end
  end
end
