class Task < ActiveRecord::Base
  attr_accessible :all_project, :ends_on, :project_id, :starts_on, :task_created_by, :task_created_on, :task_details, :title, :user_id, :task_status
  belongs_to :project
  belongs_to :user

  has_many :photos, as: :imageable
  accepts_nested_attributes_for :photos

  has_many :task_comments
  accepts_nested_attributes_for :task_comments

  #####Validations#####
  # validates :all_project, presence: true
  # validates :title, presence: true
  # validates :starts_on, presence: true
  # validates :ends_on, presence: true
  # validates :task_details, presence: true

  ####Simple Search#####
	def self.search(search)
	  if search
	    find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end
end
