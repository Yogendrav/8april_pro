class Comment < ActiveRecord::Base
  attr_accessible :add_comment, :project_id, :user_id, :add_file, :pictures_attributes
  belongs_to :project
  belongs_to :user
  has_many :pictures, as: :resource
  accepts_nested_attributes_for :pictures
end
