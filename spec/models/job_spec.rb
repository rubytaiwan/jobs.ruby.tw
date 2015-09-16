require 'rails_helper'

describe Job do

  before do
    @user = build_user
    @job = build_job(owner: @user)
  end

  describe '#search' do
    it 'could be searched by keyword' do
      expect(Job.search('ruby')).to eq [@job]
    end
  end

  describe '#aasm_state' do
    it 'should be published by default' do
      expect(@job.aasm_state).to eq 'published'
    end
  end

  describe 'open' do
    it 'should status to published' do
      @job.aasm_state = 'closed'

      @job.open
      expect(@job.aasm_state).to eq 'published'
    end
  end

  describe 'closed?' do
    it 'should return true if aasm_state is closed' do
      @job.aasm_state = 'closed'
      expect(@job.closed?).to eq true
    end

    it 'should return false if aasm_state is published' do
      @job.aasm_state = 'published'
      expect(@job.closed?).to eq false
    end
  end

  describe 'close' do
    it 'should change status to closed' do
      @job.aasm_state = 'published'

      @job.close
      expect(@job.aasm_state).to eq 'closed'
    end
  end

  describe '#to_param' do
    it 'should return downcase id-title-company' do
      expect(@job.to_param).to eq "#{@job.id}-rails-developer-ruby-taiwan"
    end
  end

  describe '#social_link_url' do
    it 'should return domain with to_param' do
      expect(@job.social_link_url).to eq "http%3A%2F%2Fjobs.ruby.tw%2Fjobs%2F#{@job.to_param}"
    end
  end

  describe '#social_link_title' do
    it 'should return escaped title' do
      expect(@job.social_link_title).to eq 'Rails+developer'
    end
  end

  describe '#social_link_content' do
    it 'should return social_link_title and social_link_url' do
      expect(@job.social_link_content).to eq "Rails+developer http%3A%2F%2Fjobs.ruby.tw%2Fjobs%2F#{@job.to_param}"
    end
  end

  describe '#deadline_forever' do
    it 'should be false if deadline is not nil' do
      expect(@job.deadline_forever).to be_falsy
    end

    it 'should be true if deadline is nil' do
      @job.deadline = nil
      expect(@job.deadline_forever).to be_truthy
    end
  end

  describe '#deadline_forever' do
    it 'should setup deadline to nil is deadline_forever is 1' do
      @job.deadline_forever = '1'
      @job.save!
      expect(@job.deadline).to eq nil
    end
  end

  describe '#owned_by?' do
    it 'returns false if nil is passed' do
      expect(@job.owned_by?(nil)).to be_falsy
    end

    it 'returns false if the passed user is not the owner' do
      expect(@job.owned_by?(build_user(email: 'not_me@example.com'))).to be_falsy
    end

    it 'returns true if the passed user is the owner' do
      expect(@job.owned_by?(@user)).to be_truthy
    end
  end

end
