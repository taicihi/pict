
class Topic < ApplicationRecord
  require 'file_size_validator'
  validates :user_id, presence: true
  validates :description, presence: true
   

  validates :image, 
    :presence => true, 
    :file_size => { 
      :maximum => 10.megabytes.to_i 
    } 
    
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :comments, ->{ order( created_at: :DESC) } 
  has_many :comment_users, through: :comments, source: 'user'
end
