require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "DELETE #destroy" do
    let(:user) { create(:user) }
    let(:token) { user.create_new_auth_token }
    
    before { delete api_v1_users_path, headers: token }

    it "returns a successful response" do
      expect(response).to be_successful
    end
    
    it "mascked user's email" do 
      expect(User.find(user.id).email).to eq("alda+#{user.id}@example.com")
    end
    
    it "mascked user's uid" do
      expect(User.find(user.id).uid).to eq("alda+#{user.id}@example.com")
    end
    
    it "update left_at" do
      expect(User.find(user.id).left_at).to be_present
    end
    
    it "make user inactive" do
      expect(User.find(user.id).left?).to be_truthy
    end
  end
end
