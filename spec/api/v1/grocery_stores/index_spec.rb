require 'rails_helper'

RSpec.describe "grocery_stores#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/grocery_stores", params: params
  end

  describe 'basic fetch' do
    let!(:grocery_store1) { create(:grocery_store) }
    let!(:grocery_store2) { create(:grocery_store) }

    it 'works' do
      expect(GroceryStoreResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['grocery_stores'])
      expect(d.map(&:id)).to match_array([grocery_store1.id, grocery_store2.id])
    end
  end
end
