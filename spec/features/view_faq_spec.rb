require File.expand_path("../../spec_helper", __FILE__)

RSpec.describe "View FAQ", type: :feature, js: true do
  scenario 'clicking on an faq' do
    visit faq_path
    page.find('h5', text: 'How can a rescue apply for ERA accreditation?').click

    expect(page).to have_content('Begin your application by clicking')
  end
end
