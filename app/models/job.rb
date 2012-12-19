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

class Job < ActiveRecord::Base
  
  attr_accessor :deadline_forever
  
  extend Searchable
  searchable_by :title, :job_type, :occupation, :company_name, :url, :location, :description, :apply_information
  
  validates_presence_of :title
  validates_presence_of :job_type
  validates_presence_of :company_name
  validates_presence_of :occupation
  validates_presence_of :location
  validates_presence_of :description
  validates_presence_of :apply_information
  validates_presence_of :owner
  
  validates_format_of :description, :with => /(ruby|rails)/i, :message => "Doesn't seem to be a Ruby or Rails related job"
  JOB_TYPE = %w[Full-time Part-time Contract Internship Other]
  OCCUPATION = ['Web back-end', 'Web front-end', 'Web-design',
                'QA/Testing', 'Other']

  validates_inclusion_of :job_type, :in => JOB_TYPE 
  validates_inclusion_of :occupation, :in => OCCUPATION
  
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"

  before_validation :set_aasm_state, :on => :create
  before_validation :set_deadline
  
  scope :published , where(:aasm_state => "published")
  scope :online, published.where("deadline is NULL or deadline > ?", Date.today )
  scope :recent, :order => "id DESC"
  
  def open
    self.aasm_state = "published"
  end
  
  def close
    self.aasm_state = "closed"
  end
  
  def closed?
    self.aasm_state == "closed"
  end
  
  def to_param
    "#{self.id}-#{self.title} #{self.company_name}".to_slug.normalize.to_s
  end
  
  def social_link_url
    CGI::escape "http://jobs.ruby.tw/jobs/#{self.to_param}"
  end
  
  def social_link_title
    CGI::escape self.title
  end
  
  def social_link_content
    "#{social_link_title} #{social_link_url}"
  end
  
  def deadline_forever
    @deadline_forever ||= !self.deadline
  end
  
  private
  
  def set_deadline
    self.deadline = nil if self.deadline_forever == "1"
  end
     
  def set_aasm_state
    self.aasm_state = "published"
  end
  
end
