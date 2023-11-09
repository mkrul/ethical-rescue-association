require File.expand_path("../../../spec_helper", __FILE__)

RSpec.describe "main/index", type: :view do
  it 'renders the "Learn More" button' do
    expected = <<-TEXT.squish
      <form class=\"button_to\" method=\"get\" action=\"/what_is_era\"><button class=\"button is-info is-large call-to-action\" type=\"submit\">Learn More</button></form>
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders a "Read More" link to /code_of_ethics' do
    expected = <<-TEXT.squish
      <a href=\"/code_of_ethics\">Read More</a>
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders a "Read More"  link to /what_is_era' do
    expected = <<-TEXT.squish
      <a href=\"/what_is_era\">Read More</a>
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders a "Read More"  link to /faq' do
    expected = <<-TEXT.squish
      <a href=\"/faq\">Read More</a>
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders a "Learn More" link to /code_of_ethics' do
    expected = <<-TEXT.squish
      <a data-method="get" href="/code_of_ethics">Learn More</a>
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders the main banner' do
    expected = <<-TEXT.squish
      data-testid="main-banner"
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders the call to action bar' do
    expected = <<-TEXT.squish
      data-testid="call-to-action"
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders the three column intro section' do
    expected = <<-TEXT.squish
      data-testid="three-column-intro"
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders the why get accredited section' do
    expected = <<-TEXT.squish
      data-testid="why-get-accredited"
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders a call-to-action banner' do
    expected = <<-TEXT.squish
      data-testid="cta-banner"
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders the testimonials section' do
    expected = <<-TEXT.squish
      data-testid="testimonials"
    TEXT

    render

    expect(rendered).to include(expected)
  end
end
