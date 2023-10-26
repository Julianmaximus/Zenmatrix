class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, presence: true
  validates :body, presence: true

  def summary
    summary = body.split[0...20].join(' ')
    summary = "#{summary[0...50]}..." if summary.length > 50
    summary
  end
end
