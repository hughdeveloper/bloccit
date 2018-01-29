require 'rails_helper'

RSpec.describe Post, type: :model do
  # the let method creates a new instance of the post class and name it post
  #  let dynamically defines a method (in this case, post), and, upon first call within a spec (the it block), computes and stores the returned value
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body")}
  describe "attributes" do
    it "has title and body attributes" do
      expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
    end
  end
end
