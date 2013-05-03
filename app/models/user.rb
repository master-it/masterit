class User < ActiveRecord::Base

  has_many :authorizations, :dependent => :destroy
  has_many :works

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :type, :first_name,
                  :last_name, :patronymic

  ROLES = %w[User Expert Moderator Admin]

  def role?(_type)
    type == _type.to_s.capitalize
  end

  def expert?
    type == :Expert
  end

  def role
    return :user if type.nil?
    type.downcase
  end

  def has_privileges?
    return role?(:admin) || role?(:moderator)
  end

  def to_s
    [last_name, first_name].compact.join(" ")
  end

end
