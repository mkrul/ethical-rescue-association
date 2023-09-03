require File.expand_path("../../test_helper", __FILE__)

RSpec.describe FaqController, type: :request do
  describe "index" do
    context "when accessed" do
      it "returns 200" do
        get faq_path

        expect(response.status).to eq 200
      end
    end
  end
end
