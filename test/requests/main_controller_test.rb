require File.expand_path("../../test_helper", __FILE__)

RSpec.describe MainController, type: :request do
  describe "root" do
    context "when accessed" do
      it "returns 200" do
        get "/"

        expect(response.status).to eq 200
      end
    end
  end
end
