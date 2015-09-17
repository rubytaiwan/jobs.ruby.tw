class Role < ActiveRecord::Base
  def admin?
    name == "admin".freeze
  end
end
