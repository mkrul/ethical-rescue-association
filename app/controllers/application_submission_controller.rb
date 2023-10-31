class ApplicationSubmissionController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    beta_testing_guard
  end

  def show; end

  def create
    beta_testing_guard

    outcome = Donations::Create.run(
      txn: payload[:tx],
      status: payload[:st],
      amount: payload[:amt],
      category: 'application_fee',
      currency: payload[:cc],
      user: current_user,
      payment_method: 'paypal'
    )

    if outcome.valid?
      ApplicationSubmissions::Create.run(
        user: current_user,
        donation: outcome.result,
        organization: payload[:org],
        specialization: payload[:spec],
        status: 'pending_submission'
      )

      # ApplicationSubmissionMailer.confirmation_email(current_user, outcome.result).deliver_now
    else
      errors = outcome.errors.full_messages.join(', ')
      redirect_to become_a_member_path, alert: "There was an error processing your application: #{errors}. Please try again or contact ERA for support."
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
