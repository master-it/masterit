class Web::Admin::WorkNominationsController < Web::Admin::ApplicationController
  def index
    @q = WorkNomination.ransack params[:q]
    @work_nominations = @q.result.page(params[:page])
  end
end
