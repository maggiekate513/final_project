require "rails_helper"

RSpec.describe "meals#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/meals/#{meal.id}", params: params
  end

  describe "basic fetch" do
    let!(:meal) { create(:meal) }

    it "works" do
      expect(MealResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("meals")
      expect(d.id).to eq(meal.id)
    end
  end
end
