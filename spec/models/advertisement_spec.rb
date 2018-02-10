require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  
  let(:advertisement) { Advertisement.create!(title: "New Post Title", body: "New Post Body", price: 10)}
  describe "attributes" do
    it "has title, body and price attributes" do
      expect(post).to have_attributes(title: "New Post Title", body: "New Post Body", price: 10)
    end
  end
end
