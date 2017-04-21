class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_processing_of :image
  acts_as_votable

  belongs_to :user
  has_many :comments, :as => :commentable
  validate :image_size_validation
  validates :image, :title, :user_id, presence: true

  private
  def image_size_validation
    errors[:image] << "should be less than 5MB" if image.size > 5.megabytes
  end
end
