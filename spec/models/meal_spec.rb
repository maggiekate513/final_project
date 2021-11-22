require "rails_helper"

RSpec.describe Meal, type: :model do
  describe "Direct Associations" do
    it { should have_many(:ingredients) }

    it { should belong_to(:recipe_inventor) }
  end

  describe "InDirect Associations" do
    it { should have_many(:stores) }

    it { should have_many(:categories) }
  end

  describe "Validations" do
  end
end
