class Comment < ApplicationRecord
  validates :reply, presence: true
  
  belongs_to :user
  belongs_to :topics, optional: true
end
