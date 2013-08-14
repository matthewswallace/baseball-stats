class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :nameFirst
      t.string :nameLast
      t.string :birthYear
      t.integer :user_id

      t.timestamps
    end
  end
end
