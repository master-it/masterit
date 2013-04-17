require 'test_helper'

class WorkNominationsControllerTest < ActionController::TestCase
  setup do
    @work_nomination = work_nominations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_nominations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_nomination" do
    assert_difference('WorkNomination.count') do
      post :create, work_nomination: { name: @work_nomination.name, state: @work_nomination.state }
    end

    assert_redirected_to work_nomination_path(assigns(:work_nomination))
  end

  test "should show work_nomination" do
    get :show, id: @work_nomination
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_nomination
    assert_response :success
  end

  test "should update work_nomination" do
    put :update, id: @work_nomination, work_nomination: { name: @work_nomination.name, state: @work_nomination.state }
    assert_redirected_to work_nomination_path(assigns(:work_nomination))
  end

  test "should destroy work_nomination" do
    assert_difference('WorkNomination.count', -1) do
      delete :destroy, id: @work_nomination
    end

    assert_redirected_to work_nominations_path
  end
end
