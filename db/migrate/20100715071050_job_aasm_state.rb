# -*- encoding : utf-8 -*-
class JobAasmState < ActiveRecord::Migration
  def self.up
    add_column :jobs, :aasm_state, :string
  end

  def self.down
    remove_column :jobs, :aasm_state
  end
end
