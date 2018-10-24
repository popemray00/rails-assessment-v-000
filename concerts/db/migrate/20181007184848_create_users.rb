class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
     t.string :username
     t.string :email
     t.string :password_digest
     t.integer :age, :default => '20'
     t.integer :money, :default => 100
      t.timestamps
    end
  end
end
