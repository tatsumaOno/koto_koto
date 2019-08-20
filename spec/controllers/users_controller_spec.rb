require 'rails_helper'

describe UsersController do
  before do
    @user = create(:user)
  end
  describe "GET new" do
    it "newページへ" do
      get :new
      expect(response).to render_template :new
    end
  end
end