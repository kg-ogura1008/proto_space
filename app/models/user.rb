class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, UserImageUploader

  has_many :comments
  has_many :likes
  has_many :prototypes

  validates :name, presence: true
end
