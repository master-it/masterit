class Web::Expert::WorksController < Web::Expert::ApplicationController
  def index
    @q = WorkCreateType.ransack params[:q]
    @works = @q.result.page(params[:page])
  end
  def estimate
    @work = WorkCreateType.find params[:id]

    if @work.update_attributes params[:work]
      flash_success
      redirect_to edit_admin_work_nomination_path(@work)
    else
      flash_error
      render action: :edit
    end
  end
end
