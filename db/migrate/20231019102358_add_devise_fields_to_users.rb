class AddDeviseFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :encrypted_password, :string
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
