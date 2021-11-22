require 'rails_helper'

RSpec.describe "grocery_stores#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/grocery_stores/#{grocery_store.id}", payload
  end

  describe 'basic update' do
    let!(:grocery_store) { create(:grocery_store) }

    let(:payload) do
      {
        data: {
          id: grocery_store.id.to_s,
          type: 'grocery_stores',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(GroceryStoreResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { grocery_store.reload.attributes }
    end
  end
end
