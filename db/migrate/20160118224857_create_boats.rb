class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :boatname
      t.integer :max_cargo
      t.integer :available_cargo
      t.integer :current_cargo
      t.integer :current_location
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
