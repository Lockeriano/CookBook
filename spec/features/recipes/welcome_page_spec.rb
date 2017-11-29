describe 'User visits welcome page' do
  before { visit('/') }

  it 'shows user welcome page' do
    expect(page).to have_content "We're gonna have some fun creating this app, old pal"
  end
end
