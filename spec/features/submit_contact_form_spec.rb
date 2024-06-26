require File.expand_path("../../spec_helper", __FILE__)

RSpec.describe "Submit feedback", type: :feature, js: true do
  scenario 'filling out and submitting the contact form' do
    visit contact_us_path
    fill_in 'name', with: 'John Doe'
    fill_in 'email', with: 'johndoe@gmail.com'
    fill_in 'message', with: 'This is a test message'

    click_button 'Submit'

    expect(page).to have_content('Thank you for contacting us. We will get back to you shortly.')
  end
end
