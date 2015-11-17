class RemoveCostFromReadings < ActiveRecord::Migration
  def change
    remove_column :readings, :cost, :decimal
  end
end
