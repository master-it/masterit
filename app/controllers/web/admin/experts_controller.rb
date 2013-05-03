class Web::Admin::ExpertsController < Web::Admin::ApplicationController
  respond_to :html
  def index
    params[:q] ||= {type_eq: "Expert"}
    @q = User.ransack params[:q]
    @experts = @q.result.page(params[:page])
    respond_with @experts, location: admin_experts_path
  end
  def show
    @expert = Expert.find params[:id]
    respond_with @expert
  end
end
