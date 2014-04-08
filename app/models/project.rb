class Project < ActiveRecord::Base
  attr_accessible :project_title, :project_created_by, :project_created_on, :project_details, :project_starts_on, :project_ends_on, :status, :invite_people, :user_id
  belongs_to :user
  STATUS = %w[Running Pending]
  has_many :pictures, as: :resource
  accepts_nested_attributes_for :pictures
  has_many :comments
  accepts_nested_attributes_for :comments
  has_many :tasks
  accepts_nested_attributes_for :tasks

  # Solar Search query
  # searchable do
  # 	text :project_title
  # end

  ####Simple Search#####
	def self.search(search)
	  if search
	    find(:all, :conditions => ['project_title LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end
end
