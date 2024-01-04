class AddYoutubeUrlToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :youtube_url, :string
  end
end
