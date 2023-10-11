class MainController < ApplicationController
  include MainHelper

  def index
    headers = request.env

    if headers["HTTP_CF_CONNECTING_IP"] == "2601:603:700:2450:51d3:26ad:234b:f255" || headers["HTTP_X_FORWARDED_FOR"] == "2601:603:700:2450:51d3:26ad:234b:f255, 172.71.151.25"
      redirect_to "https://www.youtube.com/watch?v=dQw4w9WgXcQ", allow_other_host: true
    end
  end

  def home

  end

  def phantom
    session[:era] = true

    redirect_to root_url
  end

end
