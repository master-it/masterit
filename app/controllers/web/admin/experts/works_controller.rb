class Web::Admin::Experts::WorksController < Web::Admin::Experts::ApplicationController
  def index
    @expert = User.find_by_id params[:expert_id]
    @q = Work.ransack params[:q]
    @works = @q.result.page(params[:page])
    respond_with @works, location: admin_expert_works_path
  end
  def show
    @work = Work.find_by_id params[:id]
    respond_with @work, location: admin_expert_work_path
  end
  def set_works_to_expert
    @expert = User.find params[:expert_id]
    @expert.basket = Basket.new if @expert.basket.nil?
    work = Work.find params[:id]
    estimation = Estimation.new
    work.estimations << estimation
    work.save!
    @expert.estimations << estimation
    @expert.basket.works << work
    @expert.save!
    respond_with @works, location: admin_expert_works_path
  end
end
