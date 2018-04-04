class Prototype < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
  belongs_to :user

<<<<<<< HEAD
  has_many :protos_tags
  has_many :tags, through: :protos_tags
  has_many :comments

=======
>>>>>>> origin/edit-show
  has_many :captured_images, dependent: :destroy
  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images
  acts_as_ordered_taggable_on :prototypes

  validates :title,
            :catch_copy,
            :concept,
            presence: true

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

  def set_main_thumbnail
    captured_images.main.first.content
  end

  def posted_date
    created_at.strftime('%b %d %a')
  end
end
