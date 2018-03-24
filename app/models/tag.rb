class Tag < ActiveRecord::Base
  has_many :protos_tags
  has_many :prototypes, through: :protos_tags
end
