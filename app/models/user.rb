class User < ActiveRecord::Base

  has_many :authorizations, :dependent => :destroy
  has_many :works

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :first_name,
                  :last_name, :patronymic

  ROLES = %w[user expert moderator admin]

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def to_s
    [last_name, first_name].compact.join(" ")
  end

end
