require 'rails_helper'

RSpec.describe SponsoredpostsController, type: :controller do

  let(:my_topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
  let(:my_sponsoredpost) {my_topic.sponsoredposts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {topic_id: my_topic.id, id: my_sponsoredpost.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: {topic_id: my_topic.id, id: my_sponsoredpost.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {topic_id: my_topic.id, id: my_sponsoredpost.id}
      expect(response).to have_http_status(:success)
    end
  end

end
