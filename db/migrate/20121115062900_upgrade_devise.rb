# -*- encoding : utf-8 -*-
class UpgradeDevise < ActiveRecord::Migration
  def change
    add_column :users, :reset_password_sent_at, :timestamp
  end
end
