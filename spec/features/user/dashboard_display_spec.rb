require 'rails_helper'

RSpec.describe "As a user" do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe "when I visit '/user/dashboard' " do
    it "then I should see my information displayed on the page." do
      visit '/user/dashboard'

      expect(page).to have_content("Hi #{@user.first_name}")
      expect(page).to have_content("Registered email: #{@user.email}")
      expect(page).to have_content("State of Residence: #{@user.state}")
    end

    it "then I should see stats associated with my state" do
      visit '/user/dashboard'

      within('.state-stats') do
        expect(page).to have_content('Your State\'s Stats')
        expect(page).to have_css('.aggravated-assault')
        expect(page).to have_css('.homicide')
        expect(page).to have_css('.rape')
        expect(page).to have_css('.property-crime')
        expect(page).to have_css('.arson')
      end

      within('.state-headers') do
        expect(all('th')[0].text).to eql('Crime')
        expect(all('th')[1].text).to eql('Total Occurrence')
        expect(all('th')[2].text).to eql('Percent Against State\'s Total Crimes')
        expect(all('th')[3].text).to eql('Percent Against National Occurrence')
      end

      within('.aggravated-assault') do
        expect(all('td').count).to eql(3)
        expect(first('th').text).to eql('Aggravated Assault')
        expect(all('td')[0].text).to_not be_empty
        expect(all('td')[1].text).to_not be_empty
        expect(all('td')[2].text).to_not be_empty
      end

      within('.homicide') do
        expect(all('td').count).to eql(3)
        expect(first('th').text).to eql('Homicide')
        expect(all('td')[0].text).to_not be_empty
        expect(all('td')[1].text).to_not be_empty
        expect(all('td')[2].text).to_not be_empty
      end

      within('.rape') do
        expect(all('td').count).to eql(3)
        expect(first('th').text).to eql('Rape')
        expect(all('td')[0].text).to_not be_empty
        expect(all('td')[1].text).to_not be_empty
        expect(all('td')[2].text).to_not be_empty
      end

      within('.property-crime') do
        expect(all('td').count).to eql(3)
        expect(first('th').text).to eql('Property Crime')
        expect(all('td')[0].text).to_not be_empty
        expect(all('td')[1].text).to_not be_empty
        expect(all('td')[2].text).to_not be_empty
      end

      within('.arson') do
        expect(all('td').count).to eql(3)
        expect(first('th').text).to eql('Arson')
        expect(all('td')[0].text).to_not be_empty
        expect(all('td')[1].text).to_not be_empty
        expect(all('td')[2].text).to_not be_empty
      end
    end

    it "then i see a button called 'Compare' that redirects me to that page" do
      visit user_dashboard_path

      click_on 'Compare'

      expect(page).to have_current_path('/user/compare')
    end

    it "then i see a button called 'Search' that redirects me to that page" do
      visit user_dashboard_path

      click_on 'Search'

      expect(page).to have_current_path('/user/search')
    end

  end
end
