class Photo < ApplicationRecord
  
  belongs_to :recipe
  attachment :image
end
