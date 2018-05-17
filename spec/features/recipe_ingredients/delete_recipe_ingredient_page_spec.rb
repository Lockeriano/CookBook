feature 'user deletes recipe ingredient' do
  before do
    FactoryBot.create(:recipe, :scrambled_eggs)
    FactoryBot.create(:recipe, :butter_chicken)
    visit('/')
    page.all(:xpath, '//a[contains(text(), "Show")]')[1].click
    page.all(:xpath, '//a[contains(text(), "Delete Ingredient")]')[2].click
  end

  it 'successfully deletes recipe ingredient' do
    current_path.match(%r{recipes/\d+})
    expect(page).to have_content('butter')
    expect(page).to have_content('chicken')
    expect(page).to have_no_content('salt')
    expect(page).to have_no_content('1')
    expect(page).to have_no_content('pinch')
  end
end
