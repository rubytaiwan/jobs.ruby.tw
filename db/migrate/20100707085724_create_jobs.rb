class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :title
      t.string :job_type
      t.string :occupation
      t.string :company_name
      t.string :location
      t.string :url
      t.text :description
      t.text :apply_information
      t.date :deadline

      t.integer :user_id

      t.timestamps
    end

    add_index :jobs, :user_id
  end

  def self.down
    drop_table :jobs
  end
end
