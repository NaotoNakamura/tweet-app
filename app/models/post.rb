class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :body, presence: true
  validates :body, length: { maximum: 140 }
end
