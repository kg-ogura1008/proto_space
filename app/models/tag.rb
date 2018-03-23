class Tag < ActiveRecord::Base
  balongs_to :protos_tag
  has_many :protos_tags
end
