module UserPopulator

  def self.via_facebook(user, auth_hash)
    user.email = auth_hash[:email]
    user.first_name = auth_hash[:first_name]
    user.last_name = auth_hash[:last_name]
    user.password = Devise.friendly_token[0,20]
    user
  end

  def self.via_google(user, auth_hash)
    user.email = auth_hash[:email]
    user.first_name = auth_hash[:first_name]
    user.last_name = auth_hash[:last_name]
    user.password = Devise.friendly_token[0,20]
    user
  end

  def self.via_twitter(user, auth_hash)
    user.first_name = auth_hash[:name]
    user.last_name = auth_hash[:nickname]
    user.password = Devise.friendly_token[0,20]
    user
  end

  def self.via_vkontakte(user, auth_hash)
    user.first_name = auth_hash[:name]
    user.last_name = auth_hash[:nickname]
    user.password = Devise.friendly_token[0,20]
    user
  end

end