class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :cargo_size
      t.decimal :price
      t.integer :destination
      t.integer :origin
      t.integer :employer_id
      t.integer :boat_id

      t.timestamps null: false
    end
  end
end
