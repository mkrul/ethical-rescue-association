class MainController < ApplicationController
  include MainHelper

  def index
    # Utils::Datadog::SendMetric.run(metric: 'era.pageview', value: 1)
    headers = request.env

    GotchaMailer.pwned(
      headers: headers
    ).deliver!

    redirect_to "https://www.youtube.com/watch?v=psDq93fCB8o&ab_channel=FractalArt", allow_other_host: true
  end

  private

  def gotcha

  end

end
