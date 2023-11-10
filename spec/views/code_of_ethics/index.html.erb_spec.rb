require File.expand_path("../../../spec_helper", __FILE__)

RSpec.describe "code_of_ethics/index", type: :view do
  it 'renders the main banner' do
    expected = <<-TEXT.squish
      data-testid="code-of-ethics-banner"
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders a message from the president' do
    expected = <<-TEXT.squish
      data-testid="message-from-president"
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders the code of ethics' do
    expected = <<-TEXT.squish
      data-testid="official-code-of-ethics"
    TEXT

    render

    expect(rendered).to include(expected)
  end

end
