require 'rails_helper'

RSpec.describe "As a user" do   
  describe "when I visit '/user' " do
    it "then I should click 'Leave' button and it logs me out." do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = nil
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        "uid"=>"12345",
        "info"=>
        {"email"=>"michael.g.scott@example.com",
        "first_name"=>"Michael",
        "last_name"=>"Scott"}
      })

      user = User.create(uid: "12345",
                         email: "michael.g.scott@example.com",
                         first_name: "Michael",
                         last_name: "Scott",
                         state: "Colorado")

      visit "/"
      click_on 'Login with Google'

      expect(page).to have_content("Hi #{user.first_name}")

      within "nav" do 
        click_on "Leave"
      end

      expect(page).to_not have_content(user.first_name)
      expect(page).to have_current_path("/")
      expect(page).to have_content("You have left. Goodbye!")
    end
  end 
end