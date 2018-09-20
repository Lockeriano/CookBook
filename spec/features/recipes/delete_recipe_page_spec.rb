feature 'user deletes recipe' do
  let(:user) { FactoryBot.create(:user) }
  
  before do
    FactoryBot.create(:recipe, :scrambled_eggs, user: user)
    FactoryBot.create(:recipe, :butter_chicken, user: user)
    visit('/')
    page.all(:xpath, '//a[contains(text(), "Delete")]')[1].click
  end

  it 'successfully deletes recipe' do
    expect(page).to have_current_path('/recipes')
    expect(page).to have_content('Recipe deleted successfully')
    expect(page).to have_no_content('butter chicken')
  end
end
