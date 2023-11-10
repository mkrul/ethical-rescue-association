require File.expand_path("../../../spec_helper", __FILE__)

RSpec.describe "what_is_era/index", type: :view do
  it 'renders the main banner' do
    expected = <<-TEXT.squish
      data-testid="what-is-era-banner"
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders the mission statement' do
    expected = <<-TEXT.squish
      data-testid="mission-statement"
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders our list of values' do
    expected = <<-TEXT.squish
      data-testid="our-values"
    TEXT

    render

    expect(rendered).to include(expected)
  end

  it 'renders the board of directors' do
    expected = <<-TEXT.squish
      data-testid="board-of-directors"
    TEXT

    render

    expect(rendered).to include(expected)
  end

end
