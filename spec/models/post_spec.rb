require 'rails_helper'

RSpec.describe Post, type: :model do
  # Test the columns in the db
  it "has the expected database columns" do
    should have_db_column(:title)
    should have_db_column(:body)
    # Add other columns as needed
  end

  # Test the validations and relations
  it "validates presence of tittle and body" do
    should validate_presence_of(:title)
    should validate_presence_of(:body)
  end

  it "has the expected relations" do
    should belong_to(:user)
    # Add other relations as needed
  end

  # Test other attributes or methods located in the model.
  describe "#summary" do
    it "returns the summary of the post" do
      body = Faker::Lorem.sentence(word_count: 50)
      post = FactoryBot.create(:post, body:)
      expect(post.summary).to eq("#{body[0...50]}...")
    end
  end

  # Add more tests as needed
end
