class Initial < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :team
      t.string :position
      t.float :attempts_per_game
      t.float :attempts
      t.float :yards
      t.float :yards_per_attempt
      t.float :yards_per_game
      t.float :touchdowns
      t.string :longest_rush
      t.float :first_downs
      t.float :first_down_percentage
      t.float :twenty_yards
      t.float :forty_yards
      t.float :fumbles
    end
  end
end
