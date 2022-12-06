class AddSeatToPassenger < ActiveRecord::Migration[7.0]
  def change
    add_column :passengers, :seat, :string
  end
end
