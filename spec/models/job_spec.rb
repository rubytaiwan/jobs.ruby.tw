require "rails_helper"

RSpec.describe Job do
  let(:user) { build(:user) }
  let(:job) { create(:job, owner: user) }

  context "validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :job_type }
    it { is_expected.to validate_presence_of :company_name }
    it { is_expected.to validate_presence_of :occupation }
    it { is_expected.to validate_presence_of :location }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :apply_information }
    it { is_expected.to validate_presence_of :owner }

    it { is_expected.to validate_inclusion_of(:job_type).in_array Job::JOB_TYPE }
    it { is_expected.to validate_inclusion_of(:occupation).in_array Job::OCCUPATION }
  end

  context "associations" do
    it { is_expected.to belong_to(:owner).class_name("User").with_foreign_key("user_id") }
  end

  describe ".search" do
    it "could be searched by keyword" do
      expect(Job.search("ruby")).to eq [job]
    end
  end

  describe "#open" do
    it "should status to published" do
      job.aasm_state = "closed"

      job.open
      expect(job.aasm_state).to eq "published"
    end
  end

  describe "#close" do
    it "should change status to closed" do
      job.aasm_state = "published"

      job.close
      expect(job.aasm_state).to eq "closed"
    end
  end

  describe "#closed?" do
    it "should return true if aasm_state is closed" do
      job.aasm_state = "closed"
      expect(job.closed?).to eq true
    end

    it "should return false if aasm_state is published" do
      job.aasm_state = "published"
      expect(job.closed?).to eq false
    end
  end

  describe "#to_param" do
    it "should return downcase id-title-company" do
      expect(job.to_param).to eq "#{job.id}-ruby-developer-ruby-taiwan"
    end
  end

  describe "#social_link_url" do
    it "should return domain with to_param" do
      expect(job.social_link_url).to eq "http%3A%2F%2Fjobs.ruby.tw%2Fjobs%2F#{job.to_param}"
    end
  end

  describe "#social_link_title" do
    it "should return escaped title" do
      expect(job.social_link_title).to eq "Ruby+Developer"
    end
  end

  describe "#social_link_content" do
    it "should return social_link_title and social_link_url" do
      expect(job.social_link_content).to eq "Ruby+Developer http%3A%2F%2Fjobs.ruby.tw%2Fjobs%2F#{job.to_param}"
    end
  end

  describe "#deadline_forever" do
    it "should be false if deadline is not nil" do
      job.update(deadline: Time.current)

      expect(job.deadline_forever).to eq false
    end

    it "should be true if deadline is nil" do
      job.deadline = nil

      expect(job.deadline_forever).to eq true
    end
  end

  describe "#deadline_forever" do
    it "should setup deadline to nil is deadline_forever is 1" do
      job.deadline_forever = "1"
      job.save!
      expect(job.deadline).to eq nil
    end
  end

  describe "#owned_by?" do
    let(:other_user) { build(:user, email: "not_me@example.com") }

    def owned_by?(owner)
      job.owned_by?(owner)
    end

    it "returns false if nil is passed" do
      expect(owned_by?(nil)).to eq false
    end

    it "returns false if the passed user is not the owner" do
      expect(owned_by?(other_user)).to eq false
    end

    it "returns true if the passed user is the owner" do
      expect(owned_by?(user)).to eq true
    end
  end
end
