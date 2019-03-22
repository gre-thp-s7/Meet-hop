require 'rails_helper'

RSpec.feature "Events", type: :feature do
  it 'create an event' do
    visit new_event_path

    fill_in "event[name]", with: "Contest international de Funk"
    fill_in "event[description]", with: "c'est de la foliiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiie"
    fill_in "event[address]", with: "13 rue de l'isère"
    fill_in "event[zipcode]", with: "38100"
    fill_in "event[city_name]", with: "Grenoble"
    fill_in "event[stat_date]", with: "10/12/20"
    fill_in "event[spectator_price]", with: "10"
    fill_in "event[dancer_price]", with: "20"
    fill_in "event[rules]", with: "Pas de rules, le meilleur gagne"
    fill_in "event[password]", with: "testtest"
    fill_in "event[prize_money]", with: "100 patates"

    click_button "Créer"
    expect(page).to have_content('S\'inscrire')
  end
end