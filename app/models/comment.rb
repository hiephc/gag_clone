class Comment < ApplicationRecord
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  has_many :comments, :as => :commentable
  validates :body,:user_id, presence: true
end
