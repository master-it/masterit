class Web::Admin::UsersController < Web::Admin::ApplicationController
  def index
    @q = Users.ransack params[:q]
    @users = @q.result.page(params[:page])
  end

  def new
    @user = User.new
    respond_with @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new params[:user]
    if @user.save
      flash_success
      redirect_to admin_users_path
    else
      flash_error
      render action: :new
    end
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes params[:user]
      flash_success
      redirect_to edit_admin_user_path(@user)
    else
      flash_error
      render action: :edit
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to admin_users_path
  end
  def trigger_state_event
      @user = User.find(params[:id])
      @user.fire_state_event(params[:event])

      flash_success
      redirect_to action: :index
  end
e
