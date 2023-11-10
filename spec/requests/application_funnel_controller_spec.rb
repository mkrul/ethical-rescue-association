require 'spec_helper'

RSpec.describe ApplicationFunnelController, type: :request do
  describe "index" do
    context "when accessed" do
      it "returns 200" do
        user = FactoryBot.create(:user)
        group = FactoryBot.create(:group, name: 'Testers')
        user.groups << group
        sign_in user

        get become_a_member_path

        expect(response.status).to eq 200
      end
    end
  end
end
