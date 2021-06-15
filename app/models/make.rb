class Make < ApplicationRecord
  
  belongs_to :recipe
  
  validates :method, presence: true
  
end
