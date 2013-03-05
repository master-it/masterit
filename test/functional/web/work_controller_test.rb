require 'test_helper'

class Web::WorkControllerTest < ActionController::TestCase

  setup do
    @user = create :user
    @work = create :work
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test "should get authorization with soc_network" do

  end
end