class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :image
  has_one_attached :video

  validates :title, presence: true
  validates :body, presence: true
  validates :youtube_url, format: { with: %r{\A(?:https?://)?(?:www\.)?youtu(?:be\.com/watch\?v=|\.be/)([\w\-\_]*)(&(amp;)?‌​[\w\?‌​=]*)?\z}, message: "must be a valid YouTube URL" }, allow_blank: true

  def summary
    summary = body.split[0...20].join(' ')
    summary = "#{summary[0...50]}..." if summary.length > 50
    summary
  end

  def author
    "#{user.first_name} #{user.last_name}"
  end
end
