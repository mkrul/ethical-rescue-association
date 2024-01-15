require File.expand_path("../../../spec_helper", __FILE__)

RSpec.describe "shared/_navbar", type: :view do
  it 'renders a link to the home page' do
    expected = <<-TEXT.squish
      <a class="main-title" href="http://test.host/">ETHICAL RESCUE ALLIANCE</a>
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders a link to /what_is_era' do
    expected = <<-TEXT.squish
      <a class="nav-link" href="/what_is_era">What is ERA?</a>
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders a link to /code_of_ethics' do
    expected = <<-TEXT.squish
      <a class="nav-link" href="/code_of_ethics">Code of Ethics</a>
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders a link to /faq' do
    expected = <<-TEXT.squish
      <a class="nav-link" href="/faq">FAQ</a>
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders a link to /contact_us' do
    expected = <<-TEXT.squish
      <a class="nav-link" href="/contact_us">Contact</a>
    TEXT

    render

    expect(rendered).to include(expected)
  end

end
