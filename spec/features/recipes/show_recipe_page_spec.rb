feature 'user visits show recipe page' do
  before do
    FactoryBot.create(:recipe, :scrambled_eggs)
    FactoryBot.create(:recipe, :tikka_masala)
    visit('/')
    page.all(:xpath, '//a[contains(text(), "Show")]')[1].click
  end

  it 'shows user recipe description' do
    expect(page).to have_current_path(%r{recipes/\d+})
    expect(page).to have_xpath("//img[contains(@src,'missing.jpg')]")
    expect(page).to have_content 'tikka masala'
    expect(page).to have_content 'tikka a masal'
    expect(page).to have_content 'tikka 100 mililiter'
    expect(page).to have_content 'masala 10 gram'
  end
end
