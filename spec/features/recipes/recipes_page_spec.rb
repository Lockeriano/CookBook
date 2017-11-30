feature 'user visits recipes page' do
  before do
    FactoryBot.create(:recipe, :scrambled_eggs)
    FactoryBot.create(:recipe, :boiled_eggs)
    FactoryBot.create(:recipe, :tikka_masala)
    FactoryBot.create(:recipe, :butter_chicken)
    FactoryBot.create(:recipe, :green_curry)
    visit('/')
  end

  it 'shows recipes list' do
    expect(page).to have_content 'scrambled eggs'
    expect(page).to have_content 'boiled eggs'
    expect(page).to have_content 'tikka masala'
    expect(page).to have_content 'butter chicken'
    expect(page).to have_content 'green curry'
  end
end
