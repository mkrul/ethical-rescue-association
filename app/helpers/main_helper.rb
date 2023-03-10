module MainHelper

  def log_in_text
    @user ||= User.find_by(id: session[:user_id])

    @user ? @user.email : "Log in"
  end

end
