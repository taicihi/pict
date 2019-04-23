
class Topic < ApplicationRecord
  require 'file_size_validator'
  validates :user_id, presence: true
  validates :description, presence: true
   

  validates :image, 
    :presence => true, 
    :file_size => { 
      :maximum => 0.5.megabytes.to_i 
    } 
    
  # validates :image, presence: true,  
  #                   file_size: {maximum: 10.megabytes.to_i}, 
  #                   file_content_type: { allow: ['image/jpeg', 'image/png','image/jpg'] }
  
 
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
end
