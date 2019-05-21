class Chat < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
   mount_uploader :image, ImageUploader
end
