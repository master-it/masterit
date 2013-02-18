require 'test_helper'

class Users::RegistrationsControllerTest < ActionController::TestCase
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test "should get create" do
    get :create
    assert_response :redirect
  end

end
