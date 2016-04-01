class CreateUsersGoals < ActiveRecord::Migration
  def change
    create_table :users_goals do |t|
      t.integer :user_id
      t.integer :goal_id
    end
  end
end
