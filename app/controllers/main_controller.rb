class MainController < ApplicationController
  include MainHelper
  include Utils::DataDog

  def index
    DataDog.run(metric: 'test.metric', value: 1)
  end

end
