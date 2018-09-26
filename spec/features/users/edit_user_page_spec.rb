feature 'user edit\' his profile' do
  let(:user) { FactoryBot.create(:user) }

  before do
    user
    page.set_rack_session(user_id: user.id)
    visit(edit_user_path(user))
  end

  context 'when valid params are submitted' do
    before do
      fill_in('user_name', with: user.name)
      fill_in('user_email', with: user.email)
      fill_in('user_password', with: user.password)
      fill_in('user_password_confirmation', with: user.password)
      click_button('Save')
    end

    it 'successfully updates user' do
      expect(page).to have_content('User successfully updated')
    end
  end

  context 'when invalid params are submitted' do
    before do
      fill_in('user_name', with: 'e')
      fill_in('user_email', with: 'eXaMplE')
      fill_in('user_password', with: 'pass')
      fill_in('user_password_confirmation', with: 'pas')
      click_button('Save')
    end

    it "displays error messages" do
      expect(page).to have_content('Email is invalid')
      expect(page).to have_content('Name is too short (minimum is 3 characters)')
      expect(page).to have_content('Password is too short (minimum is 6 characters)')
      expect(page).to have_content('doesn\'t match Password')
    end
  end
end
