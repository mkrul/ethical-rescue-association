class MainController < ApplicationController
  include MainHelper

  def index
    headers = request.env

    if headers["HTTP_CF_IPCITY"] == "Tacoma" && headers["HTTP_CF_REGION"] == "Washington"
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
