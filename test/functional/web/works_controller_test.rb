require 'test_helper'

class Web::WorksControllerTest < ActionController::TestCase

  setup do
    @user = create :user
    @work = create :work
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test "should get new" do

  end
end