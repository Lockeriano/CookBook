feature 'user visits edit ingredients page' do
  before do
    @ingredient = FactoryBot.create(:ingredient, :egg)
    visit('/ingredients')
    click_link('Edit')
  end

  context 'user provides valid params' do
    before do
      fill_in('ingredient_name', with: 'vinegar')
      fill_in('ingredient_unit_type', with: 'mililiter')
      click_button('Save')
    end

    it 'successfully updates ingredient' do
      current_path.match(ingredients_path)
      expect(page).to have_content('vinegar')
      expect(page).to have_content('mililiter')
    end
  end

  context 'user provides invalid params' do
    before do
      fill_in('ingredient_name', with: '')
      fill_in('ingredient_unit_type', with: '')
      click_button('Save')
    end

    it 'fails to update ingredient' do
      current_path.match(%r{/ingredients/#{@ingredient.id}/edit})
      expect(page).to have_content("can't be blank")
    end
  end
end
