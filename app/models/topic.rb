class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true,  
                    file_size: {maximum: 10.megabytes.to_i}, 
                    file_content_type: { allow: ['image/jpeg', 'image/png','image/jpg'] }
  
  # 追加
  # validates :extension_whitelist
  # validates :size_range
  # ここまで
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
end
