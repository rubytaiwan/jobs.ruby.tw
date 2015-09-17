class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
		t.string :name, limit: 30
    end
        Role.create(name: 'member')
    	Role.create(name: 'admin')
  end
end
