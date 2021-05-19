class AddUserRole < ActiveRecord::Migration[6.1]
  def change
  	add_reference :users, :role, index: true, default: 1
    add_foreign_key :users, :roles
  end
end
