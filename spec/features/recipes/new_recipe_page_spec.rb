feature 'user creates new recipe' do
  before do
    visit('/recipes/new')
  end

  context 'when valid params are submitted' do
    before do
      fill_in('recipe_name', with: 'Example name')
      fill_in('recipe_instructions', with: 'Example instructions')
      click_button('Create Recipe')
    end

    it 'creates new recipe' do
      expect(page).to have_content('Successfully created a recipe')
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
end
