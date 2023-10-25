class ApplicationFunnelController < ApplicationController

  def index
    redirect_to root_url unless current_user && current_user.developer?
  end

end
