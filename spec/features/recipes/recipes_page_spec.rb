feature 'user visits recipes page' do
  let(:user) { FactoryBot.create(:user) }

  before do
    FactoryBot.create(:recipe, :scrambled_eggs, user: user)
    FactoryBot.create(:recipe, :boiled_eggs, user: user)
    FactoryBot.create(:recipe, :tikka_masala, user: user)
    FactoryBot.create(:recipe, :butter_chicken, user: user)
    FactoryBot.create(:recipe, :green_curry, user: user)
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
