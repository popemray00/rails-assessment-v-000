class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
     t.integer :user_id
     t.integer :concert_id

      t.timestamps
    end
  end
end
