require File.expand_path("../../../spec_helper", __FILE__)

RSpec.describe "shared/_footer", type: :view do
  it 'renders the Facebook icon link' do
    expected_icon = <<-TEXT.squish
      <i class="fab fa-facebook-f fa-lg"></i>
    TEXT
    expected_link = <<-TEXT.squish
      <a target=\"_blank\" href=\"https://www.facebook.com/EthicalRescueAssociation\">\n
    TEXT

    render

    expect(rendered).to include(expected_icon)
    expect(rendered).to include(expected_link)
  end

  it 'renders the Instagram icon link' do
    expected_icon = <<-TEXT.squish
      <i class="fab fa-instagram fa-lg"></i>
    TEXT

    expected_link = <<-TEXT.squish
      <a target=\"_blank\" href=\"https://www.instagram.com/ethicalrescueassociation/\">\n
    TEXT

    render

    expect(rendered).to include(expected_icon)
    expect(rendered).to include(expected_link)
  end

  it 'renders the TikTok icon link' do
    expected_icon = <<-TEXT.squish
      <i class="fa-brands fa-tiktok"></i>
    TEXT

    expected_link = <<-TEXT.squish
      <a target=\"_blank\" href=\"https://www.tiktok.com/@ethicalrescueassociation\">\n
    TEXT

    render

    expect(rendered).to include(expected_icon)
    expect(rendered).to include(expected_link)
  end

  it 'renders a link to /contact_us' do
    expected = <<-TEXT.squish
      <a href=\"/contact_us\">Contact Us</a>
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders a link to /code_of_ethics' do
    expected = <<-TEXT.squish
      <a href=\"/code_of_ethics\">Code of Ethics</a>
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders a link to /what_is_era' do
    expected = <<-TEXT.squish
      <a href=\"/what_is_era\">What is ERA?</a>
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders a link to /faq' do
    expected = <<-TEXT.squish
      <a href=\"/faq\">FAQ</a>
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders an image link to the homepage' do
    expected = <<-TEXT.squish
      <a class="era-logo-footer" href="http://test.host/"><img src="" /></a>
    TEXT

    render

    expect(rendered).to include(expected)
  end
end
