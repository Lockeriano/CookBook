feature "user visits show recipe" do
  before do
    FactoryBot.create(:recipe, :scrambled_eggs)
    visit("/")
  end

  it "shows user clicked recipe" do
    page.all('a')[0].click
    have_css("img")
    expect(page).to have_content "scrambled eggs"
    expect(page).to have_content "egg 180 gram"
    expect(page).to have_content "butter 5 gram"
    expect(page).to have_content "salt 1 pinch"
    expect(page).to have_content "pepper 1 pinch"
    click_on('Back')
    expect(page).to have_current_path("/recipes")
  end
end
