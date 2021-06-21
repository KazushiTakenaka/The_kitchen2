class Post < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :star, presence: true
end
