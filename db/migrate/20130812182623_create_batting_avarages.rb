class CreateBattingAvarages < ActiveRecord::Migration
  def change
    create_table :batting_avarages do |t|
      t.integer :user_id
      t.integer :yearID
      t.string :teamID
      t.integer :G
      t.integer :AB
      t.integer :R
      t.integer :H
      t.integer :TWOB
      t.integer :TREEB
      t.integer :HR
      t.integer :RBI
      t.integer :SB
      t.integer :CS

      t.timestamps
    end
  end
end
