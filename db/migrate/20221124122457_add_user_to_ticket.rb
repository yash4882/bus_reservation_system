class AddUserToTicket < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :user, foreign_key: true
    add_reference :tickets, :bus, foreign_key: true
  end
end
