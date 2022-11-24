class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.integer :manager_id
      t.string :bus_number
      t.string :source
      t.string :destination
      t.date :date
      t.time :time
      t.string :bus_type

      t.timestamps
    end
  end
end
