class RescuesController < ApplicationController
  include MainHelper

  def index
    @rescues = Organization.rescues

  end

end
