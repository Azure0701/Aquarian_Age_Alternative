class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :board,optional: true

  mount_uploader :image, ImageUploader

  validates :content, presence: true, length: { in: 1..1000 }
end
