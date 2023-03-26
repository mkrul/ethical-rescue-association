require File.expand_path("../../test_helper", __FILE__)

RSpec.describe ResourcePagesController, type: :request do
  describe "#spay_and_neuter" do
    context "when accessed" do
      it 'returns 200' do
        get spay_and_neuter_path

        expect(response.status).to eq 200
      end
    end
  end

  describe "#muzzles" do
    context "when accessed" do
      it 'returns 200' do
        get muzzles_path

        expect(response.status).to eq 200
      end
    end
  end

  describe "#microchipping" do
    context "when accessed" do
      it 'returns 200' do
        get microchipping_path

        expect(response.status).to eq 200
      end
    end
  end

  describe "#fencing" do
    context "when accessed" do
      it 'returns 200' do
        get fencing_path

        expect(response.status).to eq 200
      end
    end
  end

  describe "#leashes_and_harnesses" do
    context "when accessed" do
      it 'returns 200' do
        get leashes_and_harnasses_path

        expect(response.status).to eq 200
      end
    end
  end
end