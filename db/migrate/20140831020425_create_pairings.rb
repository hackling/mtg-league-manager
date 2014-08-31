class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.references :round, index: true
      t.references :player_1, index: true
      t.references :player_2, index: true
      t.integer :player_1_wins
      t.integer :player_2_wins
      t.integer :draws

      t.timestamps
    end
  end
end
