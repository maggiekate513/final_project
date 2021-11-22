require 'rails_helper'

RSpec.describe "grocery_stores#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/grocery_stores/#{grocery_store.id}", params: params
  end

  describe 'basic fetch' do
    let!(:grocery_store) { create(:grocery_store) }

    it 'works' do
      expect(GroceryStoreResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('grocery_stores')
      expect(d.id).to eq(grocery_store.id)
    end
  end
end
