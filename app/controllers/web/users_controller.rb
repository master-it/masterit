class Web::UsersController < Web::ApplicationController
  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes params[:user]
      redirect_to edit_user_path(@user)
    else
      render action: :edit
    end
  end
end