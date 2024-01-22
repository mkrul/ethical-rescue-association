class MainController < ApplicationController
  include MainHelper

  def index
    Utils::Datadog::SendMetric.run(metric: 'test.metric', value: 1)
  end

end
