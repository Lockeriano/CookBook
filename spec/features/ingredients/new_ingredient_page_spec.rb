feature 'user visits new ingredient page' do
  let(:user) { FactoryBot.create(:user) }

  before do
    page.set_rack_session(user_id: user.id)
    visit('/ingredients/new')
  end

  context 'user attempts to create ingredient' do
    before do
      fill_in('ingredient_name', with: 'Example Ingredient')
      fill_in('ingredient_unit_type', with: 'Type')
      click_button('Save')
    end

    it 'successfully creates new ingredient' do
      current_path.match(ingredients_path)
      expect(page).to have_content('Example Ingredient Type')
    end
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
