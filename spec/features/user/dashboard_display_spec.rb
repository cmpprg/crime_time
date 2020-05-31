require 'rails_helper'

RSpec.describe "As a user" do 
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe "when I visit '/user' " do
    it "then I should see my information displayed on the page." do
      visit '/user/dashboard'

      expect(page).to have_content("Hi #{@user.first_name}")
      expect(page).to have_content("Registered email: #{@user.email}")
      expect(page).to have_content("State of Residence: #{@user.state}")
    end
  end 
end
