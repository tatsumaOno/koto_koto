require 'rails_helper'

describe UsersController do
	let(:user) {create(:user)}
	describe "GET new" do
		it "newページへ" do
			get :new
			expect(response).to render_template :new
		end
	end
end