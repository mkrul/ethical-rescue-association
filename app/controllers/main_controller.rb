class MainController < ApplicationController
  include MainHelper

  def index
    Datadog::Client.new.send_metric('era.page_views', 1)
  end

end
