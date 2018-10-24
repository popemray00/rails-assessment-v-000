class CreateConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts do |t|
      t.string :title
      t.integer :min_age
      t.integer :cost, :default => '45'
      t.datetime :time

      t.timestamps
    end
  end
end
