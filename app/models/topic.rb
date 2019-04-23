
class Topic < ApplicationRecord
  require 'file_size_validator'
  validates :user_id, presence: true
  validates :description, presence: true
   

  validates :image, 
    :presence => true, 
    :file_size => { 
      :maximum => 0.5.megabytes.to_i 
    } 
    
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites, through: :favorites, source: 'user'
end
