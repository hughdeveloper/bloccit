require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end

    it "assigns the new advertisement to @advertisement" do
      advertisement :create, params: {title: RandomData.random_word, body: RandomData.random_sentence, price: RandomData.random_number}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new post" do
      advertisement :create, params: {title: RandomData.random_word, body: RandomData.random_sentence, price: RandomData.random_number}
      expect(response).to redirect_to Advertisement.last
    end
  end

end
