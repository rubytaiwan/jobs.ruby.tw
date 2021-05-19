class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation

  has_many :jobs

  belongs_to :role

  delegate :admin?, to: :role, allow_nil: true
  
  before_validation :check_role

  def check_role
    unless self.role
      self.role = Role.find_by(name: "member") || Role.create!(name: "member")
    end
  end
end
