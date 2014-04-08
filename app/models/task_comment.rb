class TaskComment < ActiveRecord::Base
  attr_accessible :add_task_comment, :task_id, :user_id, :photos_attributes, :task_comment_created_by
  has_many :photos, as: :imageable
  accepts_nested_attributes_for :photos
  belongs_to :user
  belongs_to :task
end
