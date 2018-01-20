feature 'user visits edit recipe page' do
  before do
    FactoryBot.create(:recipe, :scrambled_eggs)
    FactoryBot.create(:recipe, :tikka_masala)
    visit('/')
    page.all(:xpath, '//a[contains(text(), "Show")]')[1].click
    page.all(:xpath, '//a[contains(text(), "Edit")]')[0].click
  end

  it 'updates data' do
    expect(page).to have_current_path(%r{recipes/\d+/edit})
    fill_in 'recipe_name', with: 'masala tikka'
    fill_in 'recipe_instructions', with: 'masal a tikka'
    fill_in 'recipe_recipe_ingridients_attributes_0_ingridient_attributes_name', with: 'egg'
    fill_in 'recipe_recipe_ingridients_attributes_0_unit_amount', with: '100'
    fill_in 'recipe_recipe_ingridients_attributes_0_ingridient_attributes_unit_type', with: 'mililiter'
    click_button 'submit'
    expect(page).to have_current_path(%r{recipes/\d+})
    expect(page).to have_field('recipe_name', with: 'masala tikka')
    expect(page).to have_field('recipe_instructions', with: 'masal a tikka')
    expect(page).to have_field('recipe_recipe_ingridients_attributes_0_ingridient_attributes_name', with: 'egg')
    expect(page).to have_field('recipe_recipe_ingridients_attributes_0_unit_amount', with: '100')
    expect(page).to have_field('recipe_recipe_ingridients_attributes_0_ingridient_attributes_unit_type', with: 'mililiter')
  end
end
