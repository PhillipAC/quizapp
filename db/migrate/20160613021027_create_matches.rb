class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :game, index: true, foreign_key: true
      
      t.timestamps null: false
    end
    add_index :matches, [:game_id, :created_at]
  end
end
