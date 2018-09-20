describe 'user visits edit recipe page' do
  let(:user) { FactoryBot.create(:user) }
  let!(:recipe) { FactoryBot.create(:recipe, :scrambled_eggs, user: user) }

  before do
    FactoryBot.create(:recipe, :tikka_masala, user: user)
    visit('/recipes')
    page.all(:xpath, '//a[contains(text(), "Show")]')[0].click
  end

  context 'when user provides valid params' do
    before do
      click_link 'Edit'
      fill_in('recipe[name]', with: 'test recipe name')
      fill_in('recipe[instructions]', with: 'test instructions')
      page.select('tikka', from: 'recipe_recipe_ingredients_attributes_0_ingredient_id')
      fill_in('recipe_recipe_ingredients_attributes_0_unit_amount', with: '50')
      click_button 'Save'
    end

    it 'successfully updates recipe' do
      expect(page).to have_current_path(recipe_path(recipe))
      expect(page).to have_content('test recipe name')
      expect(page).to have_content('test instructions')
      expect(page).to have_content('tikka')
      expect(page).to have_content('50')
    end
  end

  context 'when user provides invalid params' do
    before do
      click_link 'Edit'
      fill_in('recipe[name]', with: 'a')
      fill_in('recipe[instructions]', with: 'abc')
      page.select('butter', from: 'recipe_recipe_ingredients_attributes_0_ingredient_id')
      fill_in('recipe_recipe_ingredients_attributes_0_unit_amount', with: '10')
      click_button 'Save'
    end

    it 'fails to update recipe' do
      expect(page).to have_current_path(%r{recipes/\d+})
      expect(page).to have_content('is too short')
      expect(page).to have_content('has already been taken')
    end
  end
end
