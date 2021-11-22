require "rails_helper"

RSpec.describe "meals#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/meals/#{meal.id}", payload
  end

  describe "basic update" do
    let!(:meal) { create(:meal) }

    let(:payload) do
      {
        data: {
          id: meal.id.to_s,
          type: "meals",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(MealResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { meal.reload.attributes }
    end
  end
end
