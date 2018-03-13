feature 'user visits ingredients page' do
  before do
    FactoryBot.create(:ingredient, :egg)
    visit('/ingredients')
    click_link('Delete')
  end

  it 'successfully delete ingredient' do
    current_path.match(ingredients_path)
    expect(page).to have_content('Ingredient was deleted')
    expect(page).to have_no_content('egg')
    expect(page).to have_no_content('gram')
  end
end
