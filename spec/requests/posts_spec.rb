require "rails_helper"

RSpec.describe "Posts", type: :request do
  let(:user) { User.create!(email: 'now@example.com', password: '123456', first_name: 'Test', last_name: 'User') }
  let(:category) { Category.create!(name: 'Test Category') }

  before(:each) do
    @post = FactoryBot.create(:post, category: category)
  end

  describe "GET /posts" do
    it "should get index" do
      sign_in user
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /posts/new" do
    it "should get new" do
      sign_in user
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /posts" do
    it "should create post" do
      sign_in user

      expect do
        post posts_path,
             params: { post: { title: 'Test Title', body: 'Test Body', user_id: user.id, category_id: category.id } }
      end.to change(Post, :count).by(1)

      expect(response).to redirect_to(post_path(Post.last))
    end
  end

  describe "GET /posts/:id" do
    it "should show post" do
      sign_in user
      get post_path(@post)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /posts/:id/edit" do
    it "should get edit" do
      sign_in user
      get edit_post_path(@post)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /posts/:id" do
    it "should update post" do
      sign_in user
      patch post_path(@post), params: { post: { title: 'Updated Title' } }
      expect(response).to redirect_to(post_path(@post))
    end
  end

  describe "DELETE /posts/:id" do
    it "should destroy post" do
      sign_in user
      expect do
        delete post_path(@post)
      end.to change(Post, :count).by(-1)
      expect(response).to redirect_to(posts_path)
    end
  end
end
