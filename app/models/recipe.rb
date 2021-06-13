class Recipe < ApplicationRecord
  
  has_many :materials, dependent: :destroy
  has_many :makes, dependent: :destroy
  has_many :photos, dependent: :destroy
  
end
