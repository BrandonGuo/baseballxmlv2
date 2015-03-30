class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :year
      t.string :surname
      t.string :given_name
      t.float :avg
      t.integer :hr
      t.integer :rbi
      t.integer :runs
      t.integer :sb
      t.float :ops

      t.timestamps null: false
    end
  end
end
