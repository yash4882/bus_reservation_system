class AddTotalSeatAndAlloctedSeatToBus < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :total_seat, :integer, default: 60
    add_column :buses, :allocated_seat, :integer, default: 0
  end
end
