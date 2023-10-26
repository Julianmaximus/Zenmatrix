class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, presence: true
  has_many :posts

  def post_count
    posts.count
  end

  def profile_updated_recently? = updated_at >= 1.week.ago
end
