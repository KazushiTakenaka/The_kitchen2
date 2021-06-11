class Recipe < ApplicationRecord
  belongs_to :user
  has_many :materials, dependent: :destroy
  has_many :makes, dependent: :destroy
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :makes, :materials, :photos, allow_destroy: true
  
  validates :time, presence: true
  validates :name, presence: true
  # accepts_nested_attributes_for :materials, allow_destroy: true
  # accepts_nested_attributes_for :photos, allow_destroy: true 
end
