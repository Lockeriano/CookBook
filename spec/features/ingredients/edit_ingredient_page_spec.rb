feature 'user visits edit ingredients page' do
  before do
    FactoryBot.create(:ingredient, :egg, id: 1)
    visit('/ingredients/1/edit')
  end

  it 'sucessfully updates ingredient' do
    fill_in('ingredient_name', with: 'vinegar')
    fill_in('ingredient_unit_type', with: 'mililiter')
    click_button('Save')
    current_path.match(ingredients_path)
    expect(page).to have_content('vinegar mililiter')
  end

  context 'user provides invalid params' do
    before do
      fill_in('ingredient_name', with: '')
      fill_in('ingredient_unit_type', with: '')
      click_button('Save')
    end

    it 'fails to update ingredient' do
      current_path.match('/ingredients/1/edit')
      expect(page).to have_content("can't be blank")
    end
  end
end
