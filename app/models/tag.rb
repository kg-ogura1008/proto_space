class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :prototypes, through: :taggings
end
