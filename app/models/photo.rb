class Photo < ActiveRecord::Base
  attr_accessible :document, :image_id, :image_type
  belongs_to :imageable, polymorphic: true
  mount_uploader :document, DocumentUploader
end
