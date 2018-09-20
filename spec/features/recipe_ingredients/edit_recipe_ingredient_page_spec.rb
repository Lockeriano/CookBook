feature 'user edits recipe ingredients' do
  let(:user) { FactoryBot.create(:user) }
  let!(:first_recipe) { FactoryBot.create(:recipe, :scrambled_eggs, user: user) }

  before do
    FactoryBot.create(:recipe, :tikka_masala, user: user)
    visit(edit_recipe_path(first_recipe))
  end

  context 'when clicking plus button', js: true do
    before do
      click_link '+'
    end

    it 'sucessfully adds ingredient form' do
      wait_for_ajax
      expect(page).to have_selector('.nested-fields', count: 5)
    end
  end

  context 'when clicking minus button', js: true do
    before do
      all('.remove_fields').last.click
    end

    it 'successfully deletes recipe ingredient' do
      wait_for_ajax
      expect(page).to have_selector('.nested-fields', count: 3)
      click_button 'Save'
      expect(page).to have_current_path(%r{recipes/#{first_recipe.id}})
      expect(page).to have_no_content('pepper')
    end
  end

  context 'when adding valid ingredient' do
    before do
      click_link '+'
      all('select').last.select('tikka')
      all(:css, 'label[for=unit_amount] input').last.set '20'
      click_button 'Save'
    end

    it 'successfully saves ingredient' do
      expect(page).to have_current_path(%r{recipes/#{first_recipe.id}})
      expect(page).to have_content('tikka')
      expect(page).to have_content('20')
    end
  end

  context 'when adding invalid ingredient' do
    before do
      click_link '+'
      all('select').last.select('egg')
      all(:css, 'label[for=unit_amount] input').last.set '0'
      click_button 'Save'
    end

    it 'displays error messages' do
      expect(page).to have_content('has already been taken')
      expect(page).to have_content('must be greater than 0')
    end
  end
end
