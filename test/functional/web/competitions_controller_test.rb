require 'test_helper'

class Web::CompetitionsControllerTest < ActionController::TestCase
  setup do
    @competition = competitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:competitions)
  end


  test "should create competition" do
    assert_difference('Competition.count') do
      post :create, competition: { year: @competition.year }
    end

    assert_redirected_to competition_path(assigns(:competition))
  end

  test "should show competition" do
    get :show, id: @competition
    assert_response :success
  end


  test "should update competition" do
    put :update, id: @competition, competition: { year: @competition.year }
    assert_redirected_to competition_path(assigns(:competition))
  end

  test "should destroy competition" do
    assert_difference('Competition.count', -1) do
      delete :destroy, id: @competition
    end

    assert_redirected_to competitions_path
  end
  test "should put trigger state event" do
    put :trigger_state_event, id: @competition.id, event: :deactivate
    assert_response :redirect

    @competition.reload
    assert @competition.deactivated?
  end
end
