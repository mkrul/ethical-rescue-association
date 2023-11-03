class ApplicationFunnelController < ApplicationController


  def index
    beta_testing_guard

    if current_user.nil?
      redirect_to new_user_session_path, alert: "Please log in or create an account before submitting an application."
    end
  end

  def show
    if current_user&.application_submissions&.last&.status == "pending_submission"
      flash[:notice] = "Thank you for your donation! Please check your email for next steps on how to submit your application."
      redirect_to root_path
    end

    redirect_to root_path
  end
end
