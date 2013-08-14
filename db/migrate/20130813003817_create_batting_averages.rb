class CreateBattingAverages < ActiveRecord::Migration
  def change
    create_table :batting_averages do |t|
      t.integer :TWOB
      t.integer :TREEB
      t.integer :AB
      t.integer :CS
      t.integer :G
      t.integer :H
      t.integer :HR
      t.integer :R
      t.integer :RBI
      t.integer :SB
      t.string :teamID
      t.integer :user_id
      t.integer :yearID

      t.timestamps
    end
  end
end
