module SocNetworkHelper

  def save_omniauth_to_session
    session['omniauth.auth'] = request.env['omniauth.auth'][:info]
    session['omniauth.auth'][:provider] = request.env['omniauth.auth'][:provider]
    session['omniauth.auth'][:uid] = request.env['omniauth.auth'][:uid]
  end

  def auth_hash
    session['omniauth.auth'] 
  end

  def build_authorization(auth_hash)
    Authorization.new(provider: auth_hash[:provider], uid: auth_hash[:uid])
  end

  def get_user_by_populator(user, auth_hash)
    if auth_hash[:provider] == "facebook"
      user = UserPopulator.via_facebook(user, auth_hash)
    elsif auth_hash[:provider] == "google_oauth2"
      user = UserPopulator.via_google(user, auth_hash)
    elsif auth_hash[:provider] == "twitter"
      user = UserPopulator.via_twitter(user, auth_hash)
    elsif auth_hash[:provider] == "vkontakte"
      user = UserPopulator.via_vkontakte(user, auth_hash)
    end
    user
  end

end