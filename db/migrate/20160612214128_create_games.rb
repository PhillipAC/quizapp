class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.references :season, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :games, [:season_id, :created_at]
  end
end
