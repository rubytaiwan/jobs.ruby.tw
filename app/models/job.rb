class Job < ActiveRecord::Base
  
  extend Searchable
  searchable_by :title, :job_type, :occupation, :company_name, :url, :location, :description, :apply_information
  
  validates_presence_of :title
  validates_presence_of :job_type
  validates_presence_of :company_name
  validates_presence_of :occupation
  validates_presence_of :location
  validates_presence_of :description
  validates_presence_of :apply_information
  
  
  JOB_TYPE = %w[Part-time Full-time Contract Internship Other]
  OCCUPATION = %w[Back-end Web-Design QA/Testing Other]
  
  validates_inclusion_of :job_type, :in => JOB_TYPE 
  validates_inclusion_of :occupation, :in => OCCUPATION
  
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  
  include AASM

  aasm_initial_state :draft
  aasm_state :draft
  aasm_state :published
  aasm_state :closed
  
  
end
