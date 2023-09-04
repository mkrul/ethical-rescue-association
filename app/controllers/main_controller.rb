class MainController < ApplicationController
  include MainHelper

  def index
  end

  def home

  end

  def phantom
    session[:era] = true

    redirect_to root_url
  end

end
