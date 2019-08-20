require 'rails_helper'

describe 'user', type: :feature do
  let(:user) { create(:user) }

  it "login user" do
    visit root_path
    expect(page).to have_no_content('検索する')
    expect(page).to have_content('ログイン')
    visit login_path
    fill_in 'session_email', with: user.email 
    fill_in 'session_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq user_path(user)
  end
end