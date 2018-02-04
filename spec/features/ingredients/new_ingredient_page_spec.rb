feature 'user creates new ingredient' do
  before do
    visit('/ingredients/new')
  end

  it 'creates new ingredient' do
    fill_in('ingredient_name', with: 'Example Ingredient')
    fill_in('ingredient_unit_type', with: 'Type')
    click_button('Save')
    current_path.match(ingredients_path)
    expect(page).to have_content("Example Ingredient Type")
  end

  context 'when empty params are submitted' do
    before do
      fill_in('ingredient_name', with: '')
      fill_in('ingredient_unit_type', with: '')
      click_button('Save')
    end

    it 'displays presence errors' do
      current_path.match(new_ingredient_path)
      expect(page).to have_content("can't be blank")
    end
  end

  context 'when existing ingredient is submitted' do
    before do
      fill_in('ingredient_name', with: 'egg')
      fill_in('ingredient_unit_type', with: 'gram')
      click_button('Save')
    end

    it 'displays uniqueness error' do
      visit('/ingredients/new')
      fill_in('ingredient_name', with: 'egg')
      fill_in('ingredient_unit_type', with: 'gram')
      click_button('Save')
      current_path.match(new_ingredient_path)
      expect(page).to have_content('has already been taken')
    end
  end

  context 'when too short params are submitted' do
    before do
      fill_in('ingredient_name', with: 'e')
      fill_in('ingredient_unit_type', with: 'e')
      click_button('Save')
    end

    it 'displays length error' do
      current_path.match(new_ingredient_path)
      expect(page).to have_content('is too short')
    end
  end
end
