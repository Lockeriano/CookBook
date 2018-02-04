feature 'user visits new ingredient page' do
  before do
    visit('/ingredients/new')
  end

  it 'creates new ingredient' do
    fill_in('ingredient_name', with: 'Example Ingredient')
    fill_in('ingredient_unit_type', with: 'Type')
    click_button('Save')
    current_path.match(ingredients_path)
  end

  it 'fails to create new ingredient' do
    fill_in('ingredient_name', with: '')
    fill_in('ingredient_unit_type', with: '')
    click_button('Save')
    current_path.match(new_ingredient_path)
  end
end
