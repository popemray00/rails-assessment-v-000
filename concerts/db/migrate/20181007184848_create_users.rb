class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
     t.string :username
     t.string :email
     t.string :password_digest
     t.integer :age
     t.integer :money, :default => 100
     t.integer :uid
     t.string :image

      t.timestamps
    end
  end
end
