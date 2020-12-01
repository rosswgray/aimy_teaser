class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all

    # query = params[:query]
    # if query.present?
    #   @activities = Activity.global_search(query)
    # else
    #   @activities = Activity.all
    #   p @activities
    # end
  end

  def show
    @activity = Activity.find(params[:id])
    @sessions = @activity.sessions
  end
end
