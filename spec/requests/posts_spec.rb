require "rails_helper"

RSpec.describe "Posts", type: :request do
  before(:each) do
    @post = FactoryBot.create(:post)
  end

  describe "GET /posts" do
    it "should get index" do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /posts/new" do
    it "should get new" do
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /posts" do
    it "should create post" do
      expect do
        post posts_path, params: { post: { title: "New Post", body: "This is the body of the new post." } }
      end.to change(Post, :count).by(1)

      expect(response).to redirect_to(post_path(Post.last))
    end
  end

  describe "GET /posts/:id" do
    it "should show post" do
      get post_path(@post)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /posts/:id/edit" do
    it "should get edit" do
      get edit_post_path(@post)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /posts/:id" do
    it "should update post" do
      patch post_path(@post), params: { post: { title: "Updated Post", body: "This is the updated body of the post." } }
      expect(response).to redirect_to(post_path(@post))
    end
  end

  describe "DELETE /posts/:id" do
    it "should destroy post" do
      expect do
        delete post_path(@post)
      end.to change(Post, :count).by(-1)

      expect(response).to redirect_to(posts_path)
    end
  end
end
