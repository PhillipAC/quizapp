class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.integer :team_id
      t.integer :match_id
      
      t.timestamps null: false
    end
    
    add_index :matchups, :team_id
    add_index :matchups, :match_id
    add_index :matchups, [:team_id, :match_id], unique: true
  end
end
