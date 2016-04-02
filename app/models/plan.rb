class Plan < ActiveRecord::Base
  belongs_to :goal
  validates_presence_of :name, :description, :completed_by, :goal_id
  include Slugifiable::Instance
extend Slugifiable::Class
end
