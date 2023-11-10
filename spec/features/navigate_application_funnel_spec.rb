require File.expand_path("../../spec_helper", __FILE__)

RSpec.describe "Navigate application funnel", type: :feature, js: true do
  before(:each) do
    user ||= User.find_by(email: 'john@example.com')
    user = FactoryBot.create(:user) if user.nil?

    group ||= Group.find_by(name: 'Testers')
    group = FactoryBot.create(:group, :tester) if group.nil?

    user.groups << group

    visit new_user_session_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  scenario 'filling out and submitting the contact form for a dog rescue' do
    visit become_a_member_path

    find('#rescue', visible: false).click
    find('#next-btn-step-one').click

    find('#dogs', visible: false).click
    find('#next-btn-step-two').click

    expect(page).to have_selector('#donate-button')
  end

  scenario 'filling out and submitting the contact form for a cat rescue' do
    visit become_a_member_path

    find('#rescue', visible: false).click
    find('#next-btn-step-one').click

    find('#cats', visible: false).click
    find('#next-btn-step-two').click

    expect(page).to have_selector('#donate-button')
  end

  scenario 'filling out and submitting the contact form for a dog and cat rescue' do
    visit become_a_member_path

    find('#rescue', visible: false).click
    find('#next-btn-step-one').click

    find('#dogs-and-cats', visible: false).click
    find('#next-btn-step-two').click

    expect(page).to have_selector('#donate-button')
  end

  scenario 'filling out and submitting the contact form for a shelter' do
    visit become_a_member_path

    find('#shelter', visible: false).click
    find('#next-btn-step-one').click

    expect(page).to have_selector('#donate-button')
  end

end
