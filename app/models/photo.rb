class Photo < ApplicationRecord
  
  belongs_to :recipe
  attachment :image
  has_many :tags
  validates :image, presence: true
end
