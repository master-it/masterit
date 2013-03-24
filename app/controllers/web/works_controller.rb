class Web::WorksController < Web::ApplicationController
  def new
    @work = Work.new
  end
end