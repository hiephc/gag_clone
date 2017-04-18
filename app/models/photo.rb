class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validate :image_size_validation
  validates :image, presence: true
  validates :title, presence: true
  private
  def image_size_validation
    errors[:image] << "should be less than 5MB" if image.size > 5.megabytes
  end
end
