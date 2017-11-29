require 'rails_helper'

feature 'User visits' do
  scenario 'valid page' do
    visit('/')
    expect(page).to have_content "We're gonna have some fun creating this app, old pal"
  end
end
