require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  let(:my_advertisement) {Advertisement.create!(title: RandomData.random_word, body: RandomData.random_sentence, price: RandomData.random_number)}


  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_advertisement] to @advertisements" do
      get :index, params: {id: my_advertisement.id}
      expect(assigns(:advertisements)).to eq([my_advertisement])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: {id: my_advertisement.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "ADVERTISEMENT create" do

    it "increases the number of Advertisements by 1" do

      expect{post :create, params: { advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number}}}.to change(Advertisement,:count).by(1)
    end

    it "assigns the new advertisement to @advertisement" do
      post :create, params: { advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number}}

    end

    it "assigns the new advertisement to @advertisement" do
      # post is the verb not the object called post
      post :create, params: { advertisement: {title: RandomData.random_word, body: RandomData.random_sentence, price: RandomData.random_number}}

      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new advertisement" do

      post :create, params: { advertisement: {title: RandomData.random_word, body: RandomData.random_sentence, price: RandomData.random_number}}

      expect(response).to redirect_to Advertisement.last
    end
  end

end
