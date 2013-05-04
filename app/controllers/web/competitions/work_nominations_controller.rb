class Web::Competitions::WorkNominationsController < Web::Competitions::ApplicationController
  def index
    @work_nominations = resource_competition.work_nominations
  end
  
  def show
    @work_nomination = resource_competition.work_nominations.find params[:id]
    @work_nominations = resource_competition.work_nominations
  end

  def new_plagiat

  end

  def plagiat_send

  end
  def remove_plagiat

  end
  def edit_plagiat

  end
end
