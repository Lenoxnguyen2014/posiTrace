require 'rails_helper'
RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  describe 'valid user' do
    it "create user sucessfully" do
      expect(user).to be_valid
    end

    it "login successfully" do
        login_as user
    end
  end

    
end
