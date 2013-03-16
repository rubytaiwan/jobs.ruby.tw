# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: jobs
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  job_type          :string(255)
#  occupation        :string(255)
#  company_name      :string(255)
#  location          :string(255)
#  url               :string(255)
#  description       :text
#  apply_information :text
#  deadline          :date
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  aasm_state        :string(255)
#

require 'spec_helper'

describe Job do
    
  before do
    @user = build_user
    @job = build_job( owner: @user )
  end

  describe "#search" do
    it "could be searched by keyword" do   
      Job.search("ruby").should == [@job]
    end
  end
  
  describe "#aasm_state" do
    it "should be published by default" do
      @job.aasm_state.should == "published"
    end
  end
  
  describe "open" do
    it "should status to published" do
      @job.aasm_state = "closed"
      
      @job.open
      @job.aasm_state.should == "published"
    end
  end
  
  describe "closed?" do
    it "should return true if aasm_state is closed" do
      @job.aasm_state = "closed"
      @job.closed?.should == true
    end
    
    it "should return false if aasm_state is published" do
      @job.aasm_state = "published"
      @job.closed?.should == false
    end        
  end
  
  describe "close" do
    it "should change status to closed" do
      @job.aasm_state = "published"
            
      @job.close
      @job.aasm_state.should == "closed"
    end
  end
    
  describe "#to_param" do
    it "should return downcase id-title-company" do
      @job.to_param.should == "#{@job.id}-rails-developer-ruby-taiwan"
    end
  end
  
  describe "#social_link_url" do
    it "should return domain with to_param" do
      @job.social_link_url.should == "http%3A%2F%2Fjobs.ruby.tw%2Fjobs%2F#{@job.to_param}"
    end
  end
  
  describe "#social_link_title" do
    it "should return escaped title" do
      @job.social_link_title.should == "Rails+developer"
    end
  end
  
  describe "#social_link_content" do
    it "should return social_link_title and social_link_url" do
      @job.social_link_content.should == "Rails+developer http%3A%2F%2Fjobs.ruby.tw%2Fjobs%2F#{@job.to_param}"
    end
  end
  
  describe "#deadline_forever" do
    it "should be false if deadline is not nil" do
      @job.deadline_forever.should be_false
    end
    
    it "should be true if deadline is nil" do
      @job.deadline = nil
      @job.deadline_forever.should be_true
    end        
  end
  
  describe "#deadline_forever" do
    it "should setup deadline to nil is deadline_forever is 1" do
      @job.deadline_forever = "1"
      @job.save!    
      @job.deadline.should == nil
    end
  end

  describe '#owned_by?' do
    it 'returns false if nil is passed' do
      expect(@job.owned_by?(nil)).to be_false
    end

    it 'returns false if the passed user is not the owner' do
      expect(@job.owned_by?(build_user(:email => 'not_me@example.com'))).to be_false
    end

    it 'returns true if the passed user is the owner' do
      expect(@job.owned_by?(@user)).to be_true
    end
  end
  
end
