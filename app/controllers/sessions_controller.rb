require 'byebug'
class SessionsController < ApplicationController

  def destroy
    byebug
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end

end
