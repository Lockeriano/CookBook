feature 'user creates new recipe ingredient' do
  before do
    FactoryBot.create(:recipe, :scrambled_eggs)
    FactoryBot.create(:recipe, :tikka_masala)
    visit('/')
    page.all(:xpath, '//a[contains(text(), "Show")]')[1].click
    page.all(:xpath, '//a[contains(text(), "Add Ingredient")]')[0].click
  end

  it 'creates new recipe ingredient' do
    page.select('egg', from: 'recipe_ingredients[ingredient_id]')
    fill_in('recipe_ingredients[unit_amount]', with: '10')
    click_button('Save')
    expect(page).to have_current_path(%r{recipes/\d+})
    expect(page).to have_content('egg')
    expect(page).to have_content('10')
    expect(page).to have_content('gram')
  end

  context 'when incorrect unit amount is submitted' do
    before do
      fill_in('recipe_ingredients[unit_amount]', with: '')
      click_button('Save')
    end

    it 'displays presence errors' do
      current_path.match(%r{recipes/\d+/recipe_ingredients/new})
      expect(page).to have_content("can't be blank")
      expect(page).to have_content('is not a number')
    end
  end

  context 'when existing recipe ingredient is submitted' do
    before do
      page.select('tikka', from: 'recipe_ingredients[ingredient_id]')
      fill_in('recipe_ingredients[unit_amount]', with: '10')
      click_button('Save')
    end

    it 'displays uniqueness error' do
      current_path.match(%r{recipes/\d+/recipe_ingredients/new})
      expect(page).to have_content('has already been taken')
    end
  end
end
