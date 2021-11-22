require "rails_helper"

RSpec.describe Category, type: :model do
  describe "Direct Associations" do
    it { should have_many(:ingredients) }
  end

  describe "InDirect Associations" do
    it { should have_many(:stores) }

    it { should have_many(:meals) }
  end

  describe "Validations" do
  end
end
