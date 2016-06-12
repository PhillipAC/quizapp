class CreateCoachMemberships < ActiveRecord::Migration
  def change
    create_table :coach_memberships do |t|
      t.integer :user_id
      t.integer :team_id
      
      t.timestamps null: false
    end
    
    add_index :coach_memberships, :user_id
    add_index :coach_memberships, :team_id
    add_index :coach_memberships, [:user_id, :team_id], unique: true
  end
end
