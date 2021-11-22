require 'rails_helper'

RSpec.describe "meals#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/meals", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'meals',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(MealResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Meal.count }.by(1)
    end
  end
end
