require 'rails_helper'

RSpec.describe "As a User" do
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
end
