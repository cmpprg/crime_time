require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I try to access pages in the user namespace" do
    it "then I get a 404 error." do
      user = create(:user)
      
      visit '/user/dashboard'
      expect(page).to have_content("The page you were looking for doesn't exist.")

      visit "/user/register_state/#{user.id}/edit"
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end  
end
