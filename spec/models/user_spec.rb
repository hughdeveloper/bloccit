require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }

  it { is_expected.to have_many(:posts)}
  it { is_expected.to have_many(:votes)}
  it { is_expected.to have_many(:comments)}
  it { is_expected.to have_many(:favorites)}

   it { is_expected.to validate_presence_of(:name) }
   it { is_expected.to validate_length_of(:name).is_at_least(1) }

   it { is_expected.to validate_presence_of(:email) }
   it { is_expected.to validate_uniqueness_of(:email) }
   it { is_expected.to validate_length_of(:email).is_at_least(3) }
   it { is_expected.to allow_value("user@bloccit.com").for(:email) }

   it { is_expected.to validate_presence_of(:password) }
   it { is_expected.to have_secure_password }
   it { is_expected.to validate_length_of(:password).is_at_least(6) }

   describe "capital name" do
     it "should capitalize the first and last name" do
       user.name = "bloccit user"
       user.save
       expect(user.name).to eq "Bloccit User"
     end
   end

   describe "attributes" do
     it "should have name and email attributes" do
       expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
     end
   end

   describe "invalid user" do
     let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
     let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }

     it "should be an invalid user due to blank name" do
       expect(user_with_invalid_name).to_not be_valid
     end

     it "should be an invalid user due to blank email" do
       expect(user_with_invalid_email).to_not be_valid
     end




     #here we check if the user responds to the role that the user has/ the powers they are granted
     it "responds to role" do
       expect(user).to respond_to(:role)
     end
     # we expect user to respond to admin and check if the user is a admin or not
     it "responds to admin" do
       expect(user).to respond_to(:admin?)
     end

     it "responds to moderator" do
       expect(user).to respond_to(:moderator?)
     end
     # we expect user to respond to member and check if the user is a member or not
     it "responds to member" do
       expect(user).to respond_to(:member?)
     end
   end

   describe "roles" do
     # We expect users to be assigned as a memeber by defualt
     it "is member by default" do
       expect(user.role).to eql("member")
     end

     # here we text the member user
     context "member user" do
       it "returns true for #member?" do
         expect(user.member?).to be_truthy
       end

       it "returns false for #admin?" do
         expect(user.admin?).to be_falsey
       end
     end

     # here we test the admin user
     context "admin user" do
       before do
         user.admin!
       end

       it "returns false for #member?" do
         expect(user.member?).to be_falsey
       end

       it "returns true for #admin?" do
         expect(user.admin?).to be_truthy
       end
     end
   end

   describe "#favorite_for(post)" do
    before do
      topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
      @post = topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)
    end

    it "returns `nil` if the user has not favorited the post" do
      expect(user.favorite_for(@post)).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      favorite = user.favorites.where(post: @post).create
      expect(user.favorite_for(@post)).to eq(favorite)
    end
  end




end
