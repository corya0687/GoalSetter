class Plan < ActiveRecord::Base
  belongs_to :goals
  validates_presence_of :description, :completed_by
end
