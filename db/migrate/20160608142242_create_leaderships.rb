class CreateLeaderships < ActiveRecord::Migration
  def change
    create_table :leaderships do |t|
      t.integer :user_id
      t.integer :team_id
      
      t.timestamps null: false
    end
    
    add_index :leaderships, :user_id
    add_index :leaderships, :team_id
    add_index :leaderships, [:user_id, :team_id], unique: true
  end
end
