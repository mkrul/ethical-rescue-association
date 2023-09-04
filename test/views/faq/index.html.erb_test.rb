require File.expand_path("../../../test_helper", __FILE__)

RSpec.describe "faq/index", type: :view do
  it 'renders faq banner' do
    expected = <<-TEXT.squish
      data-testid="faq-banner"
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders the list of FAQs' do
    expected = <<-TEXT.squish
      data-testid="faq-list"
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders the section about more questions' do
    expected = <<-TEXT.squish
      data-testid="more-questions"
    TEXT

    render

    expect(rendered).to include(expected)
  end
end
