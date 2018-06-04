feature 'user creates new recipe' do
  before do
    FactoryBot.create(:recipe, :scrambled_eggs)
    visit('/recipes/new')
  end

  context 'when valid params are submitted' do
    before do
      fill_in('recipe_name', with: 'Example name')
      fill_in('recipe_instructions', with: 'Example instructions')
      page.select 'egg', from: 'recipe_recipe_ingredients_attributes_0_ingredient_id'
      fill_in('recipe_recipe_ingredients_attributes_0_unit_amount', with: '120')
      page.select 'butter', from: 'recipe_recipe_ingredients_attributes_1_ingredient_id'
      fill_in('recipe_recipe_ingredients_attributes_1_unit_amount', with: '10')
      click_button('Create Recipe')
    end

    it 'creates new recipe' do
      expect(page).to have_content('Successfully created a recipe')
      expect(page).to have_content('egg')
      expect(page).to have_content('butter')
    end
  end

  context 'when empty params are submitted' do
    before do
      fill_in('recipe_name', with: '')
      fill_in('recipe_instructions', with: '')
      click_button('Create Recipe')
    end

    it 'displays presence errors' do
      current_path.match(new_recipe_path)
      expect(page).to have_content("can't be blank")
    end
  end

  context 'when too short params are submitted' do
    before do
      fill_in('recipe_name', with: 'e')
      fill_in('recipe_instructions', with: 'e')
      click_button('Create Recipe')
    end

    it 'displays length error' do
      current_path.match(new_recipe_path)
      expect(page).to have_content('is too short')
    end
  end

  context 'when ingredients params are invalid' do
    before do
      fill_in('recipe_name', with: 'Example name')
      fill_in('recipe_instructions', with: 'Example instructions')
      page.select('egg', from: 'recipe_recipe_ingredients_attributes_0_ingredient_id')
      fill_in('recipe_recipe_ingredients_attributes_0_unit_amount', with: 'example')
      page.select('butter', from: 'recipe_recipe_ingredients_attributes_1_ingredient_id')
      fill_in('recipe_recipe_ingredients_attributes_1_unit_amount', with: 'example')
      click_button('Create Recipe')
    end

    it 'displays data type error' do
      expect(page).to have_content('is not a number')
    end
  end
end
