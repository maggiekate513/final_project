require "rails_helper"

RSpec.describe MealResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "meals",
          attributes: {},
        },
      }
    end

    let(:instance) do
      MealResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Meal.count }.by(1)
    end
  end

  describe "updating" do
    let!(:meal) { create(:meal) }

    let(:payload) do
      {
        data: {
          id: meal.id.to_s,
          type: "meals",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      MealResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { meal.reload.updated_at }
      # .and change { meal.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:meal) { create(:meal) }

    let(:instance) do
      MealResource.find(id: meal.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Meal.count }.by(-1)
    end
  end
end
