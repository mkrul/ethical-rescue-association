require File.expand_path("../../test_helper", __FILE__)

RSpec.describe JoinUsController, type: :request do
  describe "#index" do
    context "when accessed" do
      it 'returns 200' do
        get apply_path

        expect(response.status).to eq 200
      end
    end
  end
end
