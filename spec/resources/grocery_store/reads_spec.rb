require 'rails_helper'

RSpec.describe GroceryStoreResource, type: :resource do
  describe 'serialization' do
    let!(:grocery_store) { create(:grocery_store) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(grocery_store.id)
      expect(data.jsonapi_type).to eq('grocery_stores')
    end
  end

  describe 'filtering' do
    let!(:grocery_store1) { create(:grocery_store) }
    let!(:grocery_store2) { create(:grocery_store) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: grocery_store2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([grocery_store2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:grocery_store1) { create(:grocery_store) }
      let!(:grocery_store2) { create(:grocery_store) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            grocery_store1.id,
            grocery_store2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            grocery_store2.id,
            grocery_store1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
