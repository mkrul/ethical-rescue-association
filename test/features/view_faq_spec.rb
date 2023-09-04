require File.expand_path("../../test_helper", __FILE__)

RSpec.describe "View FAQ", type: :feature, js: true do
  scenario 'clicking on an faq' do
    visit '/phantom'
    visit faq_path
    page.find('h5', text: 'Does ERA support animal rights?').click

    expect(page).to have_content('Animal rights advocacy is based in the belief that')
  end
end
