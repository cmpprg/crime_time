require 'rails_helper'

RSpec.describe "As a User" do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "I cannot see the compare button in the nav bar" do
    visit user_compare_path

    within 'nav' do
      expect(page).to have_no_link("Compare")
    end
  end

  it "I cannot select the same state for state 1 and 2" do
    visit user_compare_path

    within ('.state-1') do
      select "Colorado", from: :state
    end

    within ('.state-2') do
      select "Colorado", from: :state
    end

    click_on "Compare"

    expect(current_path).to eq(user_compare_path)
    expect(page).to have_content("You cannot compare the same state. Please select two different states.")
  end

  it "I can compare stats from 2 states" do
    visit user_compare_path

    within ('.state-1') do
      expect(page).to have_select('state')
      select "Colorado", from: :state
      expect(find('.state').value).to eq("CO")
    end

    within ('.state-2') do
      expect(page).to have_select('state')
      select "Texas", from: :state
      expect(find('.state').value).to eq("TX")
    end

    click_on "Compare"

    expect(page).to have_css('.state-1-table')
    within ('.state-1-table') do
      expect(page).to have_css('.aggravated-assault')
      expect(page).to have_css('.homicide')
      expect(page).to have_css('.rape')
      expect(page).to have_css('.property-crime')
      expect(page).to have_css('.arson')
    end

    expect(page).to have_css('.state-2-table')
    within ('.state-2-table') do
      expect(page).to have_css('.aggravated-assault')
      expect(page).to have_css('.homicide')
      expect(page).to have_css('.rape')
      expect(page).to have_css('.property-crime')
      expect(page).to have_css('.arson')
    end
  end
end
