require "rails_helper"

RSpec.describe WelcomeController do
  subject(:perform_request) { get :index }
  before { perform_request }
  it 'returns success response' do
     expect(response).to be_success
  end
end
