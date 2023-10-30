class ApplicationFunnelController < ApplicationController


  def index
    beta_testing_guard
  end

end
