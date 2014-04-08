class Picture < ActiveRecord::Base
  attr_accessible :attachment, :project_id
  belongs_to :resource, polymorphic: true
  mount_uploader :attachment, AttachmentUploader
end
