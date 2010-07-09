class Job < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :job_type
  validates_presence_of :location
  validates_presence_of :description
  validates_presence_of :apply_information
   
  JOB_TYPE = %w[Part-time Full-time Contract]
  
  validates_inclusion_of :job_type, :in => JOB_TYPE 
   
  belongs_to :user
  
end
