class MainController < ApplicationController
  include MainHelper

  def index
    @venmo_url = "https://venmo.com/code?user_id=3314143247466496559&created=1680884229"
    @cashapp_url = "https://cash.app/$mkrul"
    @paypal_url = "https://www.paypal.com/paypalme/mishakrul"
  end

  def home

  end

  def phantom
    session[:era] = true

    redirect_to root_url
  end

end
