class JobAasmState < ActiveRecord::Migration[6.1]
  def self.up
    add_column :jobs, :aasm_state, :string
  end

  def self.down
    remove_column :jobs, :aasm_state
  end
end
