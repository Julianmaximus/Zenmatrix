class Category < ApplicationRecord
  # Each category can have many posts
  has_many :posts

  def post_count
    posts.count
  end

  # Validations
  validates :name, presence: true, uniqueness: true
end
