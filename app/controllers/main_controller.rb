class MainController < ApplicationController
  include MainHelper

  def index
    Utils::Datadog::SendMetric.run(metric: 'era.pageview', value: 1)
  end

end
