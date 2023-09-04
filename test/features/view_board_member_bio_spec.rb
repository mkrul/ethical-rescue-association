require File.expand_path("../../test_helper", __FILE__)

RSpec.describe "View board member bio", type: :feature, js: true do
  scenario 'view board member bio' do
    visit '/phantom'
    visit what_is_era_path
    photo = page.find("img[alt='Angela Curry']").click

    expect(page).to have_content('Angela’s passion for working with animals')
  end
end
