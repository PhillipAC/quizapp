class ChangeCoachMembershipToLeadership < ActiveRecord::Migration
  def change
    rename_table :coach_memberships, :leadership
  end
end
