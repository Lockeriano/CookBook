RSpec.describe RecipesController do
  let!(:recipe) {FactoryBot.create(:recipe, :scrambled_eggs)}

  describe 'GET index' do
    it 'assigns @recipes' do
      get :index
      expect(assigns(:recipes)).to eq([recipe])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    it 'renders the show template' do
      get :show, params: { id: recipe.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
