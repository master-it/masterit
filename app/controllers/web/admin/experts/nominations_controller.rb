class Web::Admin::Experts::NominationsController < Web::Admin::Experts::ApplicationController
  def index
    @expert = User.find_by_id params[:expert_id]
    @q = WorkNomination.ransack params[:q]
    @work_nominations = @q.result.page(params[:page])
    respond_with @work_nominations, location: admin_expert_nominations_path(expert_id: params[:expert_id])
  end

  def remove_nomination_from_expert
    @expert = User.find params[:expert_id]
    @expert.basket = Basket.new if @expert.basket.nil?
    nomination = WorkNomination.find params[:id]
    works = nomination.works
    works.each do |work|
      unless not_in_basket?(@expert, work)
        basket.works delete work
        basket.save!
        @expert.save!
      end
    end
    @q = WorkNomination.ransack params[:q]
    @work_nominations = @q.result.page(params[:page])
    respond_with @work_nominations, location: admin_expert_nominations_path(expert_id: params[:expert_id])
  end

  def set_nomination_to_expert
    @expert = User.find params[:expert_id]
    @expert.basket = Basket.new if @expert.basket.nil?
    nomination = WorkNomination.find params[:id]
    works = nomination.works
    works.each do |work|
      if not_in_basket?(@expert, work)
        estimation = Estimation.new
        work.estimations << estimation
        work.save!
        @expert.estimations << estimation
        @expert.basket.works << work
        @expert.save!
      end
    end
    @q = WorkNomination.ransack params[:q]
    @work_nominations = @q.result.page(params[:page])
    respond_with @work_nominations, location: admin_expert_nominations_path(expert_id: params[:expert_id])
  end
end
