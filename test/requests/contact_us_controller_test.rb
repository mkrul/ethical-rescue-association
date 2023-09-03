require File.expand_path("../../test_helper", __FILE__)

RSpec.describe ContactUsController, type: :request do
  describe "index" do
    context "when accessed" do
      it "returns 200" do
        get contact_us_path

        expect(response.status).to eq 200
      end
    end
  end

  describe "create" do
    context "when name, email, and message are present" do
      it "returns 200" do
        post contact_us_path, params: {
          name: "Person",
          email: "person@email.com",
          message: "This is a message."
        }

        expect(response.status).to eq 200
      end

      it "sends email" do
        ActionMailer::Base.deliveries.clear
        expect {
          post contact_us_path, params: {
            name: "Person",
            email: "person@email.com",
            message: "This is a message."
          }
        }.to change { ActionMailer::Base.deliveries.count }.by(2)
      end

      it "sets flash notice" do
        post contact_us_path, params: {
          name: "Person",
          email: "person@email.com",
          message: "This is a message."
        }

        expect(flash[:notice]).to eq "Thank you for contacting us. We will get back to you shortly."
      end
    end

    context "when name is blank" do
      it "returns 200" do
        post contact_us_path, params: {
          name: "",
          email: "person@email.com",
          message: "This is a message."
        }

        expect(response.status).to eq 302
      end

      it "sets flash error" do
        post contact_us_path, params: {
          name: "",
          email: "person@email.com",
          message: "This is a message."
        }

        expect(flash[:error]).to eq "Your name, email, and a message are required. Please try again."
      end
    end

    context "when email is blank" do
      it "returns 302" do
        post contact_us_path, params: {
          name: "Person",
          email: "",
          message: "This is a message."
        }

        expect(response.status).to eq 302
      end

      it "sets flash error" do
        post contact_us_path, params: {
          name: "Person",
          email: "",
          message: "This is a message."
        }

        expect(flash[:error]).to eq "Your name, email, and a message are required. Please try again."
      end
    end

    context "when message is blank" do
      it "returns 200" do
        post contact_us_path, params: {
          name: "Person",
          email: "person@email.com",
          message: ""
        }

        expect(response.status).to eq 302
      end

      it "sets flash error" do
        post contact_us_path, params: {
          name: "Person",
          email: "person@email.com",
          message: ""
        }

        expect(flash[:error]).to eq "Your name, email, and a message are required. Please try again."
      end
    end
  end
end
