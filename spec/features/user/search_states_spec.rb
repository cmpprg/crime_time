require 'rails_helper'

RSpec.describe "As a User" do
  describe "when I visit '/user/search'" do
    before :each do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "I cannot see the search button in nav when on search page" do
      visit '/user/dashboard'

      click_on "Search"

      expect(current_path).to eq("/user/search")

      expect(page).to have_no_link("Search")
    end

    it "then I see a state select dropdown, and, when I select a state and click search, then I see that state's stats." do
      visit '/user/search'

      within ('.state-selector') do
        expect(page).to have_select('state')
        select "Colorado", from: :state
        expect(find('.state').value).to eq("CO")
      end

      click_on "Search"

      expect(page).to have_css('.state-table')
      within ('.state-table') do
        expect(page).to have_css('.aggravated-assault')
        expect(page).to have_css('.homicide')
        expect(page).to have_css('.rape')
        expect(page).to have_css('.property-crime')
        expect(page).to have_css('.arson')
      end
    end
  end
end
