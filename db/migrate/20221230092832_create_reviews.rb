class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :review
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
