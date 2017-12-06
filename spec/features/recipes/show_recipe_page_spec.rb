feature 'user visits show recipe page' do
  before do
    FactoryBot.create(:recipe, :scrambled_eggs)
    FactoryBot.create(:recipe, :tikka_masala)
    visit('/')
  end

  it 'shows user clicked recipe' do
    page.all(:xpath, '//a[contains(text(), "Show")]')[0].click
    expect(page).to have_current_path(%r{recipes/\d+})

    expect(page).to have_css("//img[src*='.png']")
    expect(page).to have_content 'scrambled eggs'
    expect(page).to have_content 'egg 180 gram'
    expect(page).to have_content 'butter 5 gram'
    expect(page).to have_content 'salt 1 pinch'
    expect(page).to have_content 'pepper 1 pinch'

    click_on('Back')
    expect(page).to have_current_path('/recipes')
  end
end
