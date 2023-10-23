require 'rails_helper'

RSpec.describe User, type: :model do
  # 1. Test the columns in the db
  it "has a valid schema" do
    should have_db_column(:name).of_type(:string)
    should have_db_column(:email).of_type(:string)
    # Add other columns as needed
  end

  # 2. Test the validations and relations
  describe "validations and relations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    # Add other validations as needed

    it { should have_many(:posts) }
    # Add other relations as needed
  end

  context 'with DB columns' do
    {
      email: :string,
      first_name: :string,
      last_name: :string,
      encrypted_password: :string
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type(type) }
    end
  end

  describe '#post_count' do
    it 'returns the correct number of posts' do
      user = User.create!(name: 'Test User', email: 'test@example.com', password: 'test_password')
      3.times { Post.create!(user:, title: 'Test Post', content: 'Test Content') }
      expect(user.post_count).to eq(3)
    end
  end

  describe '#profile_updated_recently?' do
    it 'returns true if the profile was updated recently' do
      user = User.create!(name: 'Test User', email: 'test@example.com', password: 'test_password')
      user.update!(updated_at: 1.day.ago)
      expect(user.profile_updated_recently?).to be true
    end

    it 'returns false if the profile was not updated recently' do
      user = User.create!(name: 'Test User', email: 'test@example.com', password: 'test_password')
      user.update!(updated_at: 1.month.ago)
      expect(user.profile_updated_recently?).to be false
    end
  end
end
