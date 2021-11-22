require 'rails_helper'

RSpec.describe GroceryStoreResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'grocery_stores',
          attributes: { }
        }
      }
    end

    let(:instance) do
      GroceryStoreResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { GroceryStore.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:grocery_store) { create(:grocery_store) }

    let(:payload) do
      {
        data: {
          id: grocery_store.id.to_s,
          type: 'grocery_stores',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      GroceryStoreResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { grocery_store.reload.updated_at }
      # .and change { grocery_store.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:grocery_store) { create(:grocery_store) }

    let(:instance) do
      GroceryStoreResource.find(id: grocery_store.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { GroceryStore.count }.by(-1)
    end
  end
end
