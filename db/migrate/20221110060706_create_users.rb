class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :contact
      t.integer :role_id
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
