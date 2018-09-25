feature 'user visits profile page' do
  let(:user) { FactoryBot.create(:user) }

  context 'when user is logged in' do
    before do
      page.set_rack_session(user_id: user.id)
      visit('/')
      click_link 'Profile'
    end

    it 'successfully shows user\'s profile' do
      expect(page).to have_current_path(user_path(user))
      expect(page).to have_content(user.name)
    end
  end

  context 'when user is not logged in' do
    before do
      page.set_rack_session(user_id: nil)
      visit('/')
    end

    it 'fails to show profile button' do
      expect(page).to have_no_content('Profile')
      expect(page).to have_content('Log in')
    end
  end
end
