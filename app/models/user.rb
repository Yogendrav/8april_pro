class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :avatar, :contact_no, :country, :state, :city, :address, :zipcode, :middle_name, :user_name
  # attr_accessible :title, :body
  mount_uploader :avatar, AvatarUploader
  has_many :projects
  has_many :comments
  has_many :tasks
end
