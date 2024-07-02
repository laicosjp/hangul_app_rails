require 'rails_helper'

RSpec.describe "Api::V1::Profiles", type: :request do
  describe "GET /api/v1/profiles" do
    let(:user) { create(:user) }
    let(:token) { user.create_new_auth_token }
  
    describe "GET /show" do
      before { get api_v1_profile_path, headers: token }
  
      it { expect(response).to be_successful }
      it { expect(response.body).to include(user.email) }
    end
  end
end
