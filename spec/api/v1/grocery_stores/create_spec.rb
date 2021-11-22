require 'rails_helper'

RSpec.describe "grocery_stores#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/grocery_stores", payload
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
          type: 'grocery_stores',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(GroceryStoreResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { GroceryStore.count }.by(1)
    end
  end
end
