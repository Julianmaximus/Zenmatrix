require 'rails_helper'

RSpec.describe Category, type: :model do
  # Test the columns in the db
  it "has the expected database columns" do
    should have_db_column(:name)
    # Add other columns as needed
  end

  # Test the validations and relations
  it "validates presence and uniqueness of name" do
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
  end

  it "has the expected relations" do
    should have_many(:posts)
    # Add other relations as needed
  end

  # Test other attributes or methods located in the model.
  describe "#post_count" do
    it "returns the number of posts in the category" do
      category = Category.new(name: "Test Category")
      expect(category.post_count).to eq(0) # assuming no posts initially
    end
  end

  # Add more tests as needed
end
