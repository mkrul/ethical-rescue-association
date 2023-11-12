require 'spec_helper'

RSpec.describe ApplicationFunnelController, type: :controller do
  describe "index" do
    context "when accessed as beta tester" do
      it "returns 200" do
        user = FactoryBot.create(:user)
        group = FactoryBot.create(:group, name: 'Testers')
        user.groups << group
        sign_in user

        get :index

        expect(response.status).to eq 200
      end
    end

    context "when accessed as non-beta tester" do
      it "redirects to sign in" do
        user = FactoryBot.create(:user)
        sign_in user

        get :index

        expect(response).to redirect_to root_url
      end
    end

    context "when accessed as non-logged in user" do
      it "redirects to sign in" do
        get :index

        expect(response).to redirect_to new_user_session_url
      end
    end
  end

  describe "show" do
    context "when accessed" do
      it "returns 200" do
        user = FactoryBot.create(:user)
        group = FactoryBot.create(:group, name: 'Testers')
        user.groups << group
        sign_in user

        get :show

        expect(response.status).to eq 200
      end
    end
  end

  describe "create" do
    context "when accessed" do
      context "and application submission outcome is valid" do
        it "redirects to application_submitted_path" do
          user = FactoryBot.create(:user)
          group = FactoryBot.create(:group, name: 'Testers')
          user.groups << group
          sign_in user

          allow(ApplicationSubmissions::DetermineFormUrl).to receive(:run).and_return('http://example.com')
          allow(ApplicationSubmissions::BeginNewApplication).to receive(:run!).and_return(
              double(
                valid?: true,
                form_url: 'http://example.com'
            )
          )
          allow(ApplicationConfirmationMailer).to receive_message_chain(:confirmation, :deliver!)

          post :create, params: {
            data: {
              donation: "10.00",
              tx: "1234567890",
              st: "Completed",
              amt: "10.00",
              cc: "USD",
              cm: "1",
              item_number: "1",
              item_name: "ERA Membership",
              org: "rescue",
              spec: "dogs"
            }
          }

          expect(response.status).to eq 302
        end
      end

      context "and application submission outcome is invalid" do
        it "redirects to become_a_member_path" do
          user = FactoryBot.create(:user)
          group = FactoryBot.create(:group, name: 'Testers')
          user.groups << group
          sign_in user

          allow(ApplicationSubmissions::DetermineFormUrl).to receive(:run).and_return('http://example.com')
          allow(ApplicationSubmissions::BeginNewApplication).to receive(:run!).and_return(
              double(
                valid?: false,
                errors: double(full_messages: ['Something went wrong!'])
            )
          )

          post :create, params: {
            data: {
              donation: "10.00",
              tx: "1234567890",
              st: "Completed",
              amt: "10.00",
              cc: "USD",
              cm: "1",
              item_number: "1",
              item_name: "ERA Membership",
              org: "rescue",
              spec: "dogs"
            }
          }

          expect(response).to redirect_to become_a_member_path
          expect(flash[:alert]).to include "Something went wrong!"
        end
      end
    end
  end
end
