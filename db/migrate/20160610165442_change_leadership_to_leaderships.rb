class ChangeLeadershipToLeaderships < ActiveRecord::Migration
  def change
    rename_table :leadership, :leaderships
  end
end
