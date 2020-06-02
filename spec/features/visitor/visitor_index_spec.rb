require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'I can see the homepage' do
    visit '/'

    expect(page).to have_content('Welcome To Crime Time!')
    expect(page).to have_link('Login with Google')

    within('.national-stats') do
      expect(page).to have_content('National Stats')
      expect(page).to have_css('.aggravated-assault')
      expect(page).to have_css('.homicide')
      expect(page).to have_css('.rape')
      expect(page).to have_css('.property-crime')
      expect(page).to have_css('.arson')
    end

    within('.top-ten') do
      expect(page).to have_content('Top Ten Most Wanted')
      expect(page).to have_css('.fugitive-one')
      expect(page).to have_css('.fugitive-two')
      expect(page).to have_css('.fugitive-three')
      expect(page).to have_css('.fugitive-four')
      expect(page).to have_css('.fugitive-five')
      expect(page).to have_css('.fugitive-six')
      expect(page).to have_css('.fugitive-seven')
      expect(page).to have_css('.fugitive-eight')
      expect(page).to have_css('.fugitive-nine')
      expect(page).to have_css('.fugitive-ten')
    end
  end
end
