class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :title
      t.string :job_type
      t.string :company_name
      t.string :location
      t.string :url
      t.text :description
      t.text :apply_information
      t.date :deadline

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
