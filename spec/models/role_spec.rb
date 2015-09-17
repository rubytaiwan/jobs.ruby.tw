require "rails_helper"

RSpec.describe Role do
  describe "#admin?" do
    context "when name is empty" do
      let(:role) { build(:role) }

      it { expect(role.admin?).to eq false }
    end

    context "when name is member" do
      let(:role) { build(:role, name: "member") }

      it { expect(role.admin?).to eq false }
    end

    context "when name is admin" do
      let(:role) { create(:role, name: "admin") }

      it { expect(role.admin?).to eq true }
    end
  end
end
