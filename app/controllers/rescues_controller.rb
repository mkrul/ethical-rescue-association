class RescuesController < ApplicationController
  include MainHelper

  def index
    beta_testing_guard

    @rescues = Organization.rescues
  end

end
