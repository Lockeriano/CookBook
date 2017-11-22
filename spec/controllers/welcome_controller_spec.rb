require "rails_helper"

RSpec.describe WelcomeController do
  context "get index" do
    it "succesfully show home page" do
      get :index
    end
  end
end
