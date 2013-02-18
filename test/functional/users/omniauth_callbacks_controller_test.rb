require 'test_helper'

class Users::OmniauthCallbacksControllerTest < ActionController::TestCase
  
  setup do
    @auth_hash = generate(:soc_network_auth_hash)
    @user = create :user
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test "should get authorization with soc_network" do   
    @user.authorizations << build_authorization(@auth_hash)
    @user.save

    request.env['omniauth.auth'] = @auth_hash
    get :facebook
    # TODO придумать другой вариант
    session_user_id = session["warden.user.user.key"][1][0]
    assert_equal session_user_id, @user.id
    assert_response :redirect
  end

  # TODO пофиксить тесты
  # test "should get authorization with facebook on existing user" do
  #   @user.email = @auth_hash[:info][:email] 
  #   @user.save

  #   request.env['omniauth.auth'] = @auth_hash
  #   get :authorization

  #   @user.reload
  #   assert @user.active?
  #   assert signed_in?
  #   assert current_user.authorizations
  #   assert_response :redirect
  # end

  # test "should get authorization with facebook on new user" do
  #   request.env['omniauth.auth'] = @auth_hash
  #   @request.env["devise.mapping"] = Devise.mappings[:user]

  #   get :facebook

  #   user = User.find_by_email(@auth_hash[:info][:email])
  #   raise user.inspect
  #   assert user
  #   assert current_user.active?
  #   assert signed_in?
  #   assert current_user.authorizations
  #   assert_response :redirect
  # end


end
