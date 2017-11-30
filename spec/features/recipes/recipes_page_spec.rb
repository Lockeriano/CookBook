feature 'user visits recipes page' do
  before do
    FactoryBot.create(:recipe, :scrambled_eggs)
    visit('/')
  end

  it 'shows user an example data' do
    expect(page).to have_content Recipe.first.name
    expect(page).to have_content Recipe.first.instructions
  end
end
