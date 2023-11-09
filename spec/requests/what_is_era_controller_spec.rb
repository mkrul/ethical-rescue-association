require File.expand_path("../../spec_helper", __FILE__)

RSpec.describe WhatIsEraController, type: :request do
  describe "index" do
    context "when accessed" do
      it "returns 200" do
        get what_is_era_path

        expect(response.status).to eq 200
      end
    end
  end
end
