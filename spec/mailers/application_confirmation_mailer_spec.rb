require File.expand_path("../../spec_helper", __FILE__)

class ApplicationConfirmationMailerTest < ActionMailer::TestCase
  describe "confirmation" do
    it "should send an email" do
      ApplicationConfirmationMailer.confirmation(
        email: "test@email.com",
        form_url: "https://example.com"
      ).deliver_now

      mail = ActionMailer::Base.deliveries.last

      expect(mail.to).to eq ["test@email.com"]
      expect(mail.from).to eq ["ethicalrescueassociation@gmail.com"]
      expect(mail.subject).to eq "Complete your ERA membership application"
    end
  end
end
