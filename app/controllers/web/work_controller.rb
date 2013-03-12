class Web::WorkController < Web::ApplicationController
  def new
    @work = Work.new
  end
end