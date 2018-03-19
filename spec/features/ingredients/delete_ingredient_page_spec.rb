feature 'user deletes ingredient' do
  before do
    FactoryBot.create(:ingredient, :egg)
    FactoryBot.create(:ingredient, :salt)
    visit('/ingredients')
    page.all(:xpath, '//a[contains(text(), "Delete")]')[1].click
  end

  it 'successfully deletes ingredient' do
    current_path.match(ingredients_path)
    expect(page).to have_content('Ingredient was deleted')
    expect(page).to have_content('egg')
    expect(page).to have_content('gram')
    expect(page).to have_no_content('salt')
    expect(page).to have_no_content('pinch')
  end
end
