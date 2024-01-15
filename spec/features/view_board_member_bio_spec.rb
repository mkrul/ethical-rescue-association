require File.expand_path("../../spec_helper", __FILE__)

RSpec.describe "View board member bio", type: :feature, js: true do
  scenario 'view board member bio' do
    visit what_is_era_path
    photo = page.find("img[alt='Alexis Coleman']").click

    expect(page).to have_content('Alexis’s passion for working with animals')
  end
end
