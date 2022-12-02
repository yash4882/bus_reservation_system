class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :contact
      t.belongs_to :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
