require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe "GET #index" do
    it "トップページへの遷移確認" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end

