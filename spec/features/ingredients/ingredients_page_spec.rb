feature 'user visits ingredients page' do
  before do
    FactoryBot.create(:ingredient, :egg)
    FactoryBot.create(:ingredient, :salt)
    FactoryBot.create(:ingredient, :soy_sauce)
    visit('/ingredients')
  end

  it 'shows ingredients list' do
    expect(page).to have_content 'egg gram'
    expect(page).to have_content 'salt pinch'
    expect(page).to have_content 'soy sauce mililiter'
  end
end
