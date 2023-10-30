class ApplicationSubmissionController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    beta_testing_guard
  end

  def show

  end

  def create
    beta_testing_guard

    outcome = Donations::Create.run(
      txn: payload[:tx],
      status: payload[:st],
      amount: payload[:amt],
      currency: payload[:cc],
      custom_var: payload[:cm],
      user_id: current_user&.id,
      payment_method: 'paypal'
    )

    if outcome.valid?
      # Applications::ProcessSubmission.run(
      #   user_id: current_user&.id,
      #   custom_var: payload[:cm],
      #   donation_id: outcome.result.id
      # )

      redirect_to root_path, notice: 'Thank you for submitting your application! ERA will contact you soon with your results.'
    else
      errors = outcome.errors.full_messages.join(', ')
      redirect_to become_a_member_path, alert: "There was an error processing your application: #{errors}. Please try again or contact ERA for support."
    end
  end

  private

  def donation_params
    params.require(:data).permit(:donation, :tx, :st, :amt, :cc, :cm, :item_number, :item_name)
  end

  def payload
    @payload ||= donation_params.as_json.deep_symbolize_keys.merge!({
      user_id: current_user&.id,
      payment_method: 'paypal'
    })
  end

end
