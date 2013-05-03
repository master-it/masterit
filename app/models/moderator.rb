class Moderator < User

  attr_accessible :email, :password, :password_confirmation, :remember_me
  belongs_to :region
end
