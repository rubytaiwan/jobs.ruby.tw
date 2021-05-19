class UpgradeDevise < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reset_password_sent_at, :timestamp
  end
end
