class AddGoalIdToPlans < ActiveRecord::Migration
  def change
    add_column(:plans, :goal_id, :integer)
  end
end
