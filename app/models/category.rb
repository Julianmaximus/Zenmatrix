class Category < ApplicationRecord
  # Each category can have many posts
  has_many :posts

  # Validations
  validates :name, presence: true, uniqueness: true
end
