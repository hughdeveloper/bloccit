require 'rails_helper'

# we describe the subject of the test
RSpec.describe WelcomeController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      # call the index method of the controller
      get :index
      #we expect to render the index template
      expect(response).to render_template("index")
    end
  end
end
