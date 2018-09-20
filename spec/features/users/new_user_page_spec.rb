feature 'user sign\'s up' do
  let(:user) { FactoryBot.build(:user) }

  before do
    visit('/signup')
  end

  context 'when valid params are submitted' do
    before do
      fill_in('user_name', with: user.name)
      fill_in('user_email', with: user.email)
      fill_in('user_password', with: user.password)
      fill_in('user_password_confirmation', with: user.password)
      click_button('Sign up')
    end

    it 'creates new user' do
      expect(page).to have_content('User successfully created')
    end
  end

  context 'when invalid params are submitted' do
    before do
      fill_in('user_name', with: 'e')
      fill_in('user_email', with: 'eXaMplE')
      fill_in('user_password', with: 'pass')
      fill_in('user_password_confirmation', with: 'pas')
      click_button('Sign up')
    end

    it "displays error messages" do
      expect(page).to have_content('Email is invalid')
      expect(page).to have_content('Name is too short (minimum is 3 characters)')
      expect(page).to have_content('Password is too short (minimum is 6 characters)')
      expect(page).to have_content('doesn\'t match Password')
    end
  end
end
