class JobAasmState < ActiveRecord::Migration
  def self.up
    add_column :jobs, :aasm_state, :string
    add_column :jobs, :published_at, :datetime
  end

  def self.down
    remove_column :jobs, :aasm_state
    remove_column :jobs, :published_at
  end
end
