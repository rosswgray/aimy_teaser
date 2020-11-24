class Api::V1::ActivitiesController < Api::V1::BaseController
  def index
    @activities = Activity.all
    render json: @activities #Just for testing
  end
end