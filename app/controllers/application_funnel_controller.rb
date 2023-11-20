class ApplicationFunnelController < ApplicationController

  def index
    if current_user.nil?
      redirect_to new_user_session_path, alert: "Please log in before submitting an application."
    else
      beta_testing_guard
    end
  end

  def show
    beta_testing_guard
  end

  def create
    beta_testing_guard
    debugger

    outcome = ApplicationSubmissions::BeginNewApplication.run!(
      current_user: current_user,
      payload: payload
    )

    if outcome.valid?
      ApplicationConfirmationMailer.confirmation(
        email: current_user.email,
        form_url: outcome.form_url
      ).deliver!

      redirect_to application_submitted_path
    else
      errors = outcome.errors.full_messages.join(', ')
      redirect_to become_a_member_path, alert: "Something went wrong! #{errors}. Please try again or contact ERA for support."
    end
  end

  private

  def donation_params
    params.require(:data).permit(:donation, :tx, :st, :amt, :cc, :cm, :item_number, :item_name, :org, :spec)
  end

  def payload
    @payload ||= donation_params.as_json.deep_symbolize_keys.merge!({
      user_id: current_user&.id,
      payment_method: 'paypal',
    })
  end
end
