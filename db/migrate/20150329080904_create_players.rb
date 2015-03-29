class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :year
      t.string :surname
      t.string :given_name
      t.float :avg
      t.float :hr
      t.float :rbi
      t.float :runs
      t.float :sb
      t.float :ops

      t.timestamps null: false
    end
  end
end
