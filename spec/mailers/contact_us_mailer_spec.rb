require File.expand_path("../../spec_helper", __FILE__)

class ContactUsMailerTest < ActionMailer::TestCase
  describe "contact_us" do
    it "should send an email" do
      ContactUsMailer.contact_us(
        name: "Test User",
        email: "person@email.com",
        message: "This is a test message",
        headers: ""
      ).deliver_now

      mail = ActionMailer::Base.deliveries.last


      expect(mail.to).to eq ["mishakrul@gmail.com"]
      expect(mail.from).to eq ["person@email.com"]
      expect(mail.subject).to eq "New inquiry from Test User (person@email.com)"
    end
  end
end
