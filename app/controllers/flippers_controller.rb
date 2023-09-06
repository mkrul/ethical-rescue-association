class FlippersController < ApplicationController
  def index
    redirect_to root_path unless Rails.env.development?
  end
end
