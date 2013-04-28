class Web::Admin::WorksController < Web::Admin::ApplicationController
  def index
    @q = User.ransack params[:q]
    @users = @q.result.page(params[:page])
  end

  def invite_user_to_expert
    @user = find(params[:user_id])
    @user.becomes 
    #TODO: write service for send email
  end

end
