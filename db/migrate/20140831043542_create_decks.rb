class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.references :round, index: true
      t.references :user
      t.text :list

      t.timestamps
    end
  end
end
