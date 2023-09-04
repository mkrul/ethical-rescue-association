require File.expand_path("../../test_helper", __FILE__)

RSpec.describe "View a core value", type: :feature, js: true do
  scenario 'hovering over a core value' do
    visit what_is_era_path
    page.find_by_id('partnership-first').hover

    expect(page).to have_content('By fostering partnerships with ethical breeders')
  end
end
