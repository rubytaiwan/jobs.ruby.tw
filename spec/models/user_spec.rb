require "rails_helper"

RSpec.describe User do
  it { should delegate_method(:admin?).to(:role) }

  context "associations" do
    it { is_expected.to have_many(:jobs) }
    # it { is_expected.to belong_to(:role) }
  end
end
