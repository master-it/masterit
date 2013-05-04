class Web::Admin::ModeratorsController < Web::Admin::ApplicationController
  respond_to :html
  def index
    params[:q] ||= {type_eq: "Moderator"}
    @q = User.ransack params[:q]
    @moderators = @q.result.page(params[:page])
    respond_with @moderators, location: admin_moderators_path
  end
  def show
    @moderator = User.find params[:id]
    respond_with @moderator
  end
end
