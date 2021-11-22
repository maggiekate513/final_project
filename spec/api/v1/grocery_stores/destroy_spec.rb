require "rails_helper"

RSpec.describe "grocery_stores#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/grocery_stores/#{grocery_store.id}"
  end

  describe "basic destroy" do
    let!(:grocery_store) { create(:grocery_store) }

    it "updates the resource" do
      expect(GroceryStoreResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { GroceryStore.count }.by(-1)
      expect { grocery_store.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
