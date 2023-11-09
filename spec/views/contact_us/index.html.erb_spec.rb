require File.expand_path("../../../spec_helper", __FILE__)

RSpec.describe "contact_us/index", type: :view do
  it 'renders contact us banner' do
    expected = <<-TEXT.squish
      data-testid="contact-us-banner"
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders the feedback form' do
    expected = <<-TEXT.squish
      data-testid="feedback-form"
    TEXT

    render

    expect(rendered).to include(expected)
  end
end
