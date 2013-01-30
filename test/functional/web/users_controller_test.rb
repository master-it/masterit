require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    @params = {id: @user.id}
  end

  test "should get show" do
    get :show, @params
    assert_response :success
  end

  test "should get edit" do
    get :edit, @params
    assert_response :success
  end

  test "should get update" do
    @params[:users] = attributes_for(:user)
    put :update, @params
    assert_response :redirect
  end
end
