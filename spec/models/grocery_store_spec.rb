require "rails_helper"

RSpec.describe GroceryStore, type: :model do
  describe "Direct Associations" do
    it { should have_many(:ingredients) }
  end

  describe "InDirect Associations" do
    it { should have_many(:meals) }

    it { should have_many(:categories) }
  end

  describe "Validations" do
  end
end
