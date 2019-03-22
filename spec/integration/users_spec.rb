require 'rails_helper'

RSpec.feature "Users", type: :feature do
  it 'sign me in' do
    visit new_user_session_path

    fill_in "user[email]", with: "test@gmail.com"
    fill_in "user[password]", with: "testtest"

    click_button "Se connecter"
    expect(page).to have_content('événements')
  end
end