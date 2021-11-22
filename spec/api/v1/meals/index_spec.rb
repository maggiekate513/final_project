require "rails_helper"

RSpec.describe "meals#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/meals", params: params
  end

  describe "basic fetch" do
    let!(:meal1) { create(:meal) }
    let!(:meal2) { create(:meal) }

    it "works" do
      expect(MealResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["meals"])
      expect(d.map(&:id)).to match_array([meal1.id, meal2.id])
    end
  end
end
