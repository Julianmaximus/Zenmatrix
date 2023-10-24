class AddNameToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts
  end
end
