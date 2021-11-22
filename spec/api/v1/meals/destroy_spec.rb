require "rails_helper"

RSpec.describe "meals#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/meals/#{meal.id}"
  end

  describe "basic destroy" do
    let!(:meal) { create(:meal) }

    it "updates the resource" do
      expect(MealResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Meal.count }.by(-1)
      expect { meal.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
