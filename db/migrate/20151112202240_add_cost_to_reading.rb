class AddCostToReading < ActiveRecord::Migration
  def change
    add_column :readings, :cost, :decimal
  end
end
